Code.require_file("../support/mocks/we_work_remotely_mock.exs", __DIR__)

defmodule RagnarCoreTest.Client.WeWorkRemotelyTest do
  @moduledoc false

  use ExUnit.Case

  import Mock
  import PathHelpers

  alias RagnarCore.WeWorkRemotely

  defmacro with_request_mock(block) do
    quote do
      rss_feed = File.read!(fixture_path("weworkremotely_rss_feed.xml"))
      mocked_response = WeWorkRemotelyMock.get_programming_jobs(rss_feed)

      with_mock HTTPoison, [get: fn(_url) -> mocked_response end] do
        unquote(block)
      end
    end
  end

  def expected_url_called do
    "https://weworkremotely.com/categories/2-programming/jobs.rss"
  end

  def first_job_date do
    Timex.parse!("Thu, 07 Sep 2017 22:11:40 +0000", "{RFC1123}")
  end

  def expected_first_job_details do
    %RagnarCore.JobDetails{
      client: "we_work_remotely",
      origin_url: "https://weworkremotely.com/jobs/5335-customer-success-engineer",
      publication_date: first_job_date(),
      title: "Parse.ly: Customer Success Engineer"
    }
  end

  def assert_commons(result) do
    assert called HTTPoison.get(expected_url_called())
    assert is_list(result)
    assert List.first(result) == expected_first_job_details()
  end

  test "find_jobs/1 when days_limit param is nil" do
    with_request_mock do
      result = WeWorkRemotely.find_jobs(nil)

      assert_commons(result)
      assert length(result) == 15
    end
  end

  test "find_jobs/1 when days_limit param is 2" do
    with_request_mock do
      # We need to mock Timex.today to match dates from jobs fixture.
      with_mock RagnarCore.TimexHelper, [today: fn() -> first_job_date() end] do
        days_limit = 1
        result = WeWorkRemotely.find_jobs(days_limit)

        assert_commons(result)
        assert length(result) == 7
      end
    end
  end
end
