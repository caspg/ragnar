defmodule RagnarCore.WeWorkRemotely do
  @moduledoc """
  Module responsible for fetching and parsing jobs
  from https://weworkremotely.com.
  """

  alias RagnarCore.Helper
  alias RagnarCore.WeWorkRemotely.Client
  alias RagnarCore.WeWorkRemotely.Parser

  def find_jobs(nil) do
    rss_feed = Client.fetch_jobs_rss()
    Parser.parse_rss_feed(rss_feed)
  end

  def find_jobs(days_limit) do
    find_jobs(nil)
    |> Enum.filter(&job_is_not_old?(&1, days_limit))
  end

  defp job_is_not_old?(job, days_limit) do
    Helper.not_older_than_x_days?(days_limit, job.publication_date)
  end
end
