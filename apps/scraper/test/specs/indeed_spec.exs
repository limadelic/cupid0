defmodule Scraper.IndeedSpec do

  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  setup do

    Application.put_env :scraper, :http_client, Scraper.MockHTTP
    expect Scraper.MockHTTP, :get, fn url ->
      send self(), {:get, url}
      {:ok, %{body: ""}}
    end
    :ok

  end

  test "search with criteria" do

    {:ok, jobs} = Scraper.Indeed.search(
      position: "software engineer",
      work_type: "Remote",
      salary: "$135,000+",
      posted: "Last 24 hours",
      sort: "Date"
    )

    assert length(jobs) > 0

  end

end
