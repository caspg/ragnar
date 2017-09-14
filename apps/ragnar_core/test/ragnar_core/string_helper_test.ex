defmodule RagnarCore.StringHelperTest do
  @moduledoc false

  use ExUnit.Case

  import RagnarCore.StringHelper

  def test_string do
    """
    Elixir is a dynamic, functional language designed for building scalable and maintainable applications.
    Elixir leverages the Erlang VM, known for running low-latency, distributed and fault-tolerant systems,
    while also being successfully used in web development and the embedded software domain.
    """
  end

  test "string_contains_any_term?" do
    assert string_contains_any_term?(test_string(), ["elixir"])
    assert string_contains_any_term?(test_string(), ["EliXir", "Banana"])
    assert string_contains_any_term?(test_string(), ["Orange", "ElixiR", "Banana"])

    refute string_contains_any_term?(test_string(), ["Orange", "Banana"])
    refute string_contains_any_term?(test_string(), ["Orange"])
  end

  test "string_contains_all_terms?" do
    assert string_contains_all_terms?(test_string(), ["Elixir"])
    assert string_contains_all_terms?(test_string(), ["elixir"])
    assert string_contains_all_terms?(test_string(), ["EliXiR", "Erlang VM"])
    assert string_contains_all_terms?(test_string(), ["Erlang vM", "Elixir", "embeDded"])

    refute string_contains_all_terms?(test_string(), ["Banana"])
    refute string_contains_all_terms?(test_string(), ["Elixir", "Banana"])
    refute string_contains_all_terms?(test_string(), ["grumpy dog", "Elixir", "Banana"])
  end
end
