defmodule Eligram.Update do
  def normalize(%{"message" => msg}),
    do: {:message, msg}

  def normalize(%{"callback_query" => cq}),
    do: {:callback_query, cq}

  def normalize(_),
    do: :unknown
end
