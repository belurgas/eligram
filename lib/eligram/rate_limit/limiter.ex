defmodule Eligram.RateLimit.Limiter do
  use GenServer

  @name __MODULE__

  ## Public API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: @name)
  end

  @doc """
  Checks whether an action is allowed under the current rate limits.
  """
  @spec allow?(atom()) :: :ok | {:error, :rate_limited}
  def allow?(action) when is_atom(action) do
    GenServer.call(@name, {:allow, action})
  end

  ## GenServer

  @impl true
  def init(_) do
    limits = load_limits()
    {:ok, limits}
  end

  @impl true
  def handle_call({:allow, action}, _from, state) do
    case check_limit(action, state) do
      :ok ->
        emit_telemetry(action, :ok)
        {:reply, :ok, state}

      {:error, :rate_limited} = error ->
        emit_telemetry(action, :rate_limited)
        {:reply, error, state}
    end
  end

  ## Internal

  defp check_limit(action, limits) do
    key = {:telegram_ex, action}

    case Hammer.check_rate(key, limits.scale_ms, limits.limit) do
      {:allow, _count} -> :ok
      {:deny, _count} -> {:error, :rate_limited}
    end
  end

  defp load_limits do
    Application.get_env(:eligram, __MODULE__)[:global] || %{scale_ms: 1000, limit: 30}
  end

  defp emit_telemetry(action, result) do
    :telemetry.execute(
      [:eligram, :rate_limiter],
      %{count: 1},
      %{action: action, result: result}
    )
  end
end
