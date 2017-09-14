defmodule RagnarCore.WeWorkRemotely do
  @moduledoc """
  Module responsible for fetching, parsing and searching jobs
  from https://weworkremotely.com.
  """

  alias RagnarCore.JobsSearch
  alias RagnarCore.JobsFilter
  alias RagnarCore.WeWorkRemotely.Client
  alias RagnarCore.WeWorkRemotely.Parser

  @doc """
  Returns jobs matching terms.

  ## Options

    * `:contain_all?` (boolean) - if true, all terms must be included.
      If false, just single term must be included.

    * `:days_limit` (positive integer | nil) - specify limit of the
      job's add publication date.

  """
  @spec find_jobs([String.t], keyword) :: [%RagnarCore.JobDetails{}]

  def find_jobs(terms, options \\ []) do
    contain_all? = Keyword.get(options, :contain_all?, false)
    days_limit   = Keyword.get(options, :days_limit, nil)

    Client.fetch_jobs_rss()
    |> Parser.parse_rss_feed()
    |> JobsFilter.maybe_filter_jobs_by_date(days_limit)
    |> JobsSearch.search_terms(terms, contain_all?)
  end
end
