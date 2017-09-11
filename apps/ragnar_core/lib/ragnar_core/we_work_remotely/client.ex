defmodule RagnarCore.WeWorkRemotely.Client do
  @programming_jobs_rss_url(
    "https://weworkremotely.com/categories/2-programming/jobs.rss"
  )

  def fetch_programming_jobs_rss do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} =
      get_programmin_jobs_rss()

    body
  end

  defp get_programmin_jobs_rss do
    HTTPoison.get(@programming_jobs_rss_url)
  end
end

defmodule RagnarCore.WeWorkRemotely.ClientRequest do
end
