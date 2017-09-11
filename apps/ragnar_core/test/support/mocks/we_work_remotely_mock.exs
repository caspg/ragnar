defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil, request_url: nil
end

defmodule WeWorkRemotelyMock do
  def get_programming_jobs(response_body) do
    { :ok, successful_response(response_body) }
  end

  defp successful_response(response_body) do
    %HTTPoison.Response{
      body: response_body,
      headers: [
        {"Server", "Cowboy"}, {"Connection", "keep-alive"},
        {"X-Frame-Options", "SAMEORIGIN"}, {"X-Xss-Protection", "1; mode=block"},
        {"X-Content-Type-Options", "nosniff"},
        {"Date", "Sun, 10 Sep 2017 21:03:12 GMT"},
        {"Content-Type", "application/rss+xml; charset=utf-8"},
        {"Cache-Control", "max-age=600, public"},
        {"Etag", "W/\"046ce9ac562fe6ea61f4ebc334cd3c00\""},
        {"X-Request-Id", "c28cf1b3-54d6-4f0b-abae-033f766eab41"},
        {"X-Runtime", "3.922444"}, {"Strict-Transport-Security", "max-age=31536000"},
        {"Transfer-Encoding", "chunked"}, {"Via", "1.1 vegur"}
      ],
      request_url: "https://weworkremotely.com/categories/2-programming/jobs.rss",
      status_code: 200
    }
  end
end
