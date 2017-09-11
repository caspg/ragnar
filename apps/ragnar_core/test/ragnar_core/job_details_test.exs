defmodule RagnarCoreTest.Client.JobDetailsTest do
  use ExUnit.Case

  alias RagnarCore.JobDetails

  @we_work_remotely "we_work_remotely"

  test "we_work_remotely_client_name" do
    assert JobDetails.we_work_remotely_client_name === @we_work_remotely
  end

  test "available_clients" do
    assert JobDetails.available_clients === [@we_work_remotely]
  end
end
