defmodule Eligram.Config do
  use GenServer

  def start_link(_),
    do: GenServer.start_link(__MODULE__, %{}, name: __MODULE__)

  def get(key),
    do: Application.fetch_env!(:eligram, key)

  def token,
    do: get(:token)
end
