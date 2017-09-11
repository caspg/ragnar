defmodule RagnarCore.Client.WeWorkRemotely do
  def fetch_programming_jobs_rss do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} =
      RagnarCore.Client.WeWorkRemotelyRequest.get()

    body
  end
end

defmodule RagnarCore.Client.WeWorkRemotelyRequest do
  @programming_jobs_rss_url(
    "https://weworkremotely.com/categories/2-programming/jobs.rss"
  )

  def get do
    HTTPoison.get(@programming_jobs_rss_url)
  end
end
