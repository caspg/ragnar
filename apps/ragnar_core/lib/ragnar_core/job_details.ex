defmodule RagnarCore.JobDetails do
  @enforce_keys [:title, :origin_url, :publication_date, :client]
  defstruct [:title, :origin_url, :publication_date, :client]

  @we_work_remotely_client_name "we_work_remotely"
  @available_clients [@we_work_remotely_client_name]

  def we_work_remotely_client_name, do: @we_work_remotely_client_name
  def available_clients, do: @available_clients
end
