defmodule RagnarCore.StringHelper do
  @moduledoc """
  Provides missing string functions.
  """

  @spec string_contains_any_term?(String.t, [String.t], [String.t]) :: boolean

  def string_contains_any_term?(string, terms, []) do
    # ~r/(TERM1|TERM2)/i
    regex = terms
            |> Enum.join("|")
            |> (fn(string) -> "(#{string})" end).()
            |> Regex.compile!("i")

    String.match?(string, regex)
  end

  def string_contains_any_term?(string, terms, terms_blacklist) do
    !String.contains?(string, terms_blacklist) &&
      string_contains_any_term?(string, terms, [])
  end

  @spec string_contains_all_terms?(String.t, [String.t], [String.t]) :: boolean

  def string_contains_all_terms?(string, terms, []) do
    Enum.all?(terms, fn(term) -> string_contains_term?(string, term) end)
  end

  def string_contains_all_terms?(string, terms, terms_blacklist) do
    !String.contains?(string, terms_blacklist) &&
      string_contains_all_terms?(string, terms, [])
  end

  defp string_contains_term?(string, term) do
    regex = Regex.compile!(term, "i")

    String.match?(string, regex)
  end
end
