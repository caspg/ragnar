defmodule RagnarCore do
  alias RagnarCore.WeWorkRemotely

  def find_programming_jobs(days_limit \\ nil) do
    %{
      we_work_remotely: WeWorkRemotely.find_programming_jobs(days_limit),
    }
  end
end
