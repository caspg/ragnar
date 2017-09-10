defmodule RagnarCoreTest do
  use ExUnit.Case
  doctest RagnarCore

  test "greets the world" do
    assert RagnarCore.hello() == :world
  end
end
