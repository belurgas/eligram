defmodule Eligram.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: Eligram.Finch},
      Eligram.Config,
      Eligram.RateLimit.Limiter,
      Eligram.Queue,
      Telegram.Dispatcher,
      Telegram.Poller
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Eligram.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
