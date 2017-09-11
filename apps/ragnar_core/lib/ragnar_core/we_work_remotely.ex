defmodule RagnarCore.WeWorkRemotely do
  def find_programming_jobs do
    rss_feed = RagnarCore.WeWorkRemotely.Client.fetch_programming_jobs_rss()
    parsed_jobs = RagnarCore.WeWorkRemotely.Parser.parse_rss_feed(rss_feed)

    parsed_jobs
  end
end
