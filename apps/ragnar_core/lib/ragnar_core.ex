defmodule RagnarCore do
  def find_programming_jobs do
    %{
      we_work_remotely: RagnarCore.WeWorkRemotely.find_programming_jobs(),
    }
  end
end
