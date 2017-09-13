defmodule RagnarCore.JobsFilter do
  @moduledoc """
  Functions for filtering list of JobsDetails.
  """

  alias RagnarCore.JobDetails
  alias RagnarCore.Helper

  @doc """
  Filter JobDetails list by publication_date,only if
  `days_limit` argument is specified.
  """
  @type jobs_list :: [%JobDetails{}]
  @spec maybe_filter_jobs_by_date(jobs_list, nil | integer) :: jobs_list

  def maybe_filter_jobs_by_date(jobs, nil), do: jobs
  def maybe_filter_jobs_by_date(jobs, days_limit) do
    jobs
    |> Enum.filter(&job_is_not_old?(&1, days_limit))
  end

  defp job_is_not_old?(job, days_limit) do
    Helper.not_older_than_x_days?(days_limit, job.publication_date)
  end
end
