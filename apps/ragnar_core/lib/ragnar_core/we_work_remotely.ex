defmodule RagnarCore.WeWorkRemotely do
  alias RagnarCore.Helper

  def find_programming_jobs(nil) do
    rss_feed = RagnarCore.WeWorkRemotely.Client.fetch_programming_jobs_rss()
    RagnarCore.WeWorkRemotely.Parser.parse_rss_feed(rss_feed)
  end

  def find_programming_jobs(days_limit) do
    find_programming_jobs(nil)
    |> Enum.filter(&job_is_not_old?(&1, days_limit))
  end

  defp job_is_not_old?(job, days_limit) do
    Helper.not_older_than_x_days?(days_limit, job.publication_date)
  end
end
