defmodule EligramTest do
  use ExUnit.Case
  doctest Eligram

  test "greets the world" do
    assert Eligram.hello() == :world
  end
end
