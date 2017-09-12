defmodule RagnarCore.JobDetails do
  @moduledoc """
  Module defining JobDetails struct.
  """

  @enforce_keys [:title, :origin_url, :publication_date, :client]
  defstruct [:title, :origin_url, :publication_date, :client]

  @we_work_remotely_client_name "we_work_remotely"

  def we_work_remotely_client_name, do: @we_work_remotely_client_name
end
