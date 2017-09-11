defmodule RagnarCore.Parser.WeWorkRemotely do
  def parse_rss_feed(rss_feed) do
    rss_feed
    |> Floki.find("item")
    |> Enum.map(&(create_job_details(&1)))
  end

  defp create_job_details(floki_item_tree) do
    job_details_map = find_needed_details(floki_item_tree)
    struct(RagnarCore.JobDetails, job_details_map)
  end

  defp find_needed_details(floki_item_tree) do
    %{
      client: RagnarCore.JobDetails.we_work_remotely_client_name(),
      title: find_nodes_text(floki_item_tree, "title"),
      origin_url: find_nodes_text(floki_item_tree, "link"),
      publication_date: parse_publication_date(floki_item_tree, "pubdate")
    }
  end

  defp parse_publication_date(floki_item_tree, node_name)  do
    find_nodes_text(floki_item_tree, "pubdate")
    |> Timex.parse!("{RFC1123}")
  end

  defp find_nodes_text(floki_tree, node_name) do
    Floki.find(floki_tree, node_name)
    |> Floki.text
  end
end
