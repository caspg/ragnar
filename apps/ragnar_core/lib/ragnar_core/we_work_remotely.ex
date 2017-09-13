defmodule RagnarCore.WeWorkRemotely do
  @moduledoc """
  Module responsible for fetching, parsing and searching jobs
  from https://weworkremotely.com.
  """

  alias RagnarCore.JobsSearch
  alias RagnarCore.Helper
  alias RagnarCore.WeWorkRemotely.Client
  alias RagnarCore.WeWorkRemotely.Parser

  @doc """
  Returns jobs matching terms.

  ## Options

    * `:contain_all?` (boolean) - if true, all terms must be included.
      If false, just single term must be included.

    * `:days_limit` (positive integer) - specify how old job add could be.

  """
  @spec find_jobs([String.t], keyword) :: [%RagnarCore.JobDetails{}]

  def find_jobs(terms, options \\ []) do
    contain_all? = Keyword.get(options, :contain_all?, false)
    days_limit   = Keyword.get(options, :days_limit, nil)

    fetch_and_parse_jobs
    |> maybe_filter_jobs_by_date(days_limit)
    |> JobsSearch.search_terms(terms, [contain_all?: contain_all?])
  end

  defp fetch_and_parse_jobs do
    rss_feed = Client.fetch_jobs_rss()
    Parser.parse_rss_feed(rss_feed)
  end

  defp maybe_filter_jobs_by_date(jobs, nil), do: jobs
  defp maybe_filter_jobs_by_date(jobs, days_limit) do
    jobs
    |> Enum.filter(&job_is_not_old?(&1, days_limit))
  end

  defp job_is_not_old?(job, days_limit) do
    Helper.not_older_than_x_days?(days_limit, job.publication_date)
  end
end
