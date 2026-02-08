defmodule Eligram.Handlers.Dsl do
  defmacro __using__(_opts) do
    quote do
      import Eligram.Handlers.Dsl
      Module.register_attribute(__MODULE__, :handlers, accumulate: true)
      @before_compile Eligram.Handlers.Dsl
    end
  end

  defmacro command(name, do: block) do
    quote do
      @handlers {:command, unquote(name), fn ctx -> unquote(block) end}
    end
  end
end
