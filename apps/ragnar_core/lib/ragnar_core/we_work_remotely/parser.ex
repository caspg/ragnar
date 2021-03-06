defmodule RagnarCore.WeWorkRemotely.Parser do
  @moduledoc false

  alias RagnarCore.JobDetails

  def parse_rss_feed(rss_feed) do
    rss_feed
    |> Floki.find("item")
    |> Enum.map(&(create_job_details(&1)))
  end

  defp create_job_details(floki_item_tree) do
    job_details_map = find_needed_details(floki_item_tree)
    struct(JobDetails, job_details_map)
  end

  defp find_needed_details(floki_item_tree) do
    %{
      client: JobDetails.we_work_remotely_client_name(),
      title: find_nodes_text(floki_item_tree, "title"),
      origin_url: find_nodes_text(floki_item_tree, "link"),
      description: parse_description(floki_item_tree),
      publication_date: parse_publication_date(floki_item_tree),
    }
  end

  defp parse_description(floki_item_tree) do
    floki_item_tree
    |> find_nodes_text("description")
    |> String.replace(~r/<[^>]*>/, "")
  end

  defp parse_publication_date(floki_item_tree)  do
    floki_item_tree
    |> find_nodes_text("pubdate")
    |> Timex.parse!("{RFC1123}")
  end

  defp find_nodes_text(floki_tree, node_name) do
    floki_tree
    |> Floki.find(node_name)
    |> Floki.text
  end
end
