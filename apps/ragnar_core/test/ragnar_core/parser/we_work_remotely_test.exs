defmodule RagnarCoreTest.Parser.WeWorkRemotelyTest do
  use ExUnit.Case

  import PathHelpers

  def first_job_details do
    %RagnarCore.JobDetails{
      client: "we_work_remotely",
      origin_url: "https://weworkremotely.com/jobs/5335-customer-success-engineer",
      publication_date: Timex.parse!("Thu, 07 Sep 2017 22:11:40 +0000", "{RFC1123}"),
      title: "Parse.ly: Customer Success Engineer"
    }
  end

  test "parsing rss_feed" do
    rss_feed = File.read!(fixture_path("weworkremotely_rss_feed.xml"))
    parsed_jobs = RagnarCore.Parser.WeWorkRemotely.parse_rss_feed(rss_feed)

    assert length(parsed_jobs) == 15
    assert List.first(parsed_jobs) == first_job_details()
  end
end
