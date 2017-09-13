defmodule RagnarCore.StringHelper do
  @moduledoc """
  Provides missing string functions.
  """

  @spec string_contains_all_terms?(String.t, [String.t]) :: boolean
  def string_contains_all_terms?(string, terms) do
    # Regex which match string containg all terms
    # https://stackoverflow.com/a/4389683/4490927
    #
    # ~r/^(?=.*\bTERM1\b)(?=.*\bTERM2\b).*$/i
    regex = terms
            |> Enum.map(fn(term) -> "(?=.*\\b#{term}\\b)" end)
            |> Enum.join("")
            # |> (fn(string) -> "^#{string}.*$" end).()
            |> Regex.compile!("i")

    String.match?(string, regex)
  end

  @spec string_contains_all_terms?(String.t, [String.t]) :: boolean
  def string_contains_any_term?(string, terms) do
    # ~r/(TERM1 | TERM2)/i
    regex = terms
            |> Enum.join(" | ")
            |> (fn(string) -> "(#{string})" end).()
            |> Regex.compile!("i")

    String.match?(string, regex)
  end
end
