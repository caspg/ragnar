defmodule RagnarCore.JobsSearch do
  @moduledoc """
  The `RagnarCore.JobsSearch` module is responsible for finding jobs
  that contains provided terms.
  """

  alias RagnarCore.JobDetails
  alias RagnarCore.StringHelper

  @type jobs :: [%JobDetails{}]
  @spec search_terms(jobs, [String.t], [contain_all?: boolean]) :: jobs

  @doc """
  Returns jobs that contains terms.

  Looks for job that contains all terms or any, this behaviour can
  be specified with `contain_all?` keword.
  Terms are case insensitive.
  """
  def search_terms(jobs, terms, contain_all?: contain_all?) do
    jobs
    |> Enum.filter(&job_contains_terms?(&1, terms, contain_all?))
  end

  defp job_contains_terms?(job_details, terms, false) do
    %JobDetails{title: title, description: description} = job_details

    StringHelper.string_contains_any_term?(title, terms, []) ||
      StringHelper.string_contains_any_term?(description, terms, [])
  end

  defp job_contains_terms?(job_details, terms, true) do
    %JobDetails{title: title, description: description} = job_details

    StringHelper.string_contains_all_terms?(title, terms, []) ||
      StringHelper.string_contains_all_terms?(description, terms, [])
  end
end
