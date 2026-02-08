defmodule Eligram.Handlers.Behaviour do
  @callback handle(update :: map(), ctx :: map()) :: any()
end
