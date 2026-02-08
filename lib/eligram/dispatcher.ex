defmodule Eligram.Dispatcher do
  use GenServer

  def start_link(_),
    do: GenServer.start_link(__MODULE__, %{}, name: __MODULE__)

  def dispatch(update) do
    GenServer.cast(__MODULE__, {:dispatch, update})
  end

  @impl true
  def handle_cast({:dispatch, update}, state) do
    update
    |> Eligram.Update.normalize()
    |> Eligram.Handlers.Registry.dispatch()

    {:noreply, state}
  end
end
