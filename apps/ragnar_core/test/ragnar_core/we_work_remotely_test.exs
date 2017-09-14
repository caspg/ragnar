Code.require_file("../support/mocks/we_work_remotely_mock.exs", __DIR__)
Code.require_file("../support/factories/job_details_factory.exs", __DIR__)

defmodule RagnarCoreTest.Client.WeWorkRemotelyTest do
  @moduledoc false

  use ExUnit.Case

  import Mock
  import PathHelpers

  alias RagnarCore.WeWorkRemotely
  alias RagnarCore.TimexHelper

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

  def assert_commons(result) do
    assert called HTTPoison.get(expected_url_called())
    assert is_list(result)
    assert List.first(result) ==
      JobDetailsFactory.weworkremotely_roaster_tools()
  end

  test "find_jobs/1" do
    with_request_mock do
      terms = ["React", "Rails"]
      result = WeWorkRemotely.find_jobs(terms)

      assert length(result) == 7
      assert_commons(result)
    end
  end

  describe "find_jobs/2" do
    test "when `contain_all?` is set to true" do
      with_request_mock do
        terms = ["React", "Rails"]
        result = WeWorkRemotely.find_jobs(terms, contain_all?: true)

        assert length(result) == 5
        assert_commons(result)
      end
    end

    test "when `day_limit` option is set to 4" do
      mocked_time = Timex.parse!("Thu, 07 Sep 2017 22:11:40 +0000", "{RFC1123}")

      with_request_mock do
        # We need to mock Timex.today to match dates from jobs fixture.
        with_mock TimexHelper, [today: fn() -> mocked_time end] do
          terms = ["React", "Rails"]
          options = [contain_all?: true, days_limit: 1]
          result = WeWorkRemotely.find_jobs(terms, options)

          assert length(result) == 2
          assert_commons(result)
        end
      end
    end
  end
end
