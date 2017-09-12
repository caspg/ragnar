Code.require_file("../../support/mocks/we_work_remotely_mock.exs", __DIR__)

defmodule RagnarCoreTest.WeWorkRemotely.ClientTest do
  use ExUnit.Case

  import Mock

  test "a successful fetching programming jobs" do
    expected_url_called = "https://weworkremotely.com/categories/2-programming/jobs.rss"
    mocked_response_body = "<rss></rss>"
    mocked_response = WeWorkRemotelyMock.get_programming_jobs(mocked_response_body)

    with_mock HTTPoison, [get: fn(_url) -> mocked_response end] do
      response = RagnarCore.WeWorkRemotely.Client.fetch_jobs_rss()

      assert called HTTPoison.get(expected_url_called)
      assert response === mocked_response_body
    end
  end
end
