defmodule Eligram do
  @moduledoc """
  Telegram bot framework for Elixir.
  """

  alias Eligram.Dispatcher

  @doc """
  Dispatch a raw Telegram update.
  """
  def dispatch(update) do
    Dispatcher.dispatch(update)
  end

  @doc """
  Send a message.
  """
  def send_message(chat_id, text, opts \\ []) do
    Eligram.Client.send_message(chat_id, text, opts)
  end
end
