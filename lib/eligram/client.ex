defmodule Eligram.Client do
  @base "https://api/telegram.org/bot"

  def send_message(chat_id, text, opts \\ []) do
    request(
      "sendMessage",
      %{
        chat_id: chat_id,
        text: text
      }
      |> Map.merge(Map.new(opts))
    )
  end

  defp request(method, params) do
    token = Eligram.Config.token()
    url = "#{@base}#{token}/#{method}"

    # Finch - request here - later
    {:ok, %{url: url, params: params}}
  end
end
