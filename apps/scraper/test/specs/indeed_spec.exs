defmodule Scraper.IndeedSpec do
  use ExUnit.Case
  import Mox

  @criteria [
    position: "software engineer",
    work_type: "Remote",
    salary: "$135,000+",
    posted: "Last 24 hours",
    sort: "Date"
  ]

  setup :verify_on_exit!

  setup do
    Application.put_env :scraper, :http_client, Scraper.MockHTTP
    expect Scraper.MockHTTP, :get, fn url -> 
      expected = "https://www.indeed.com/jobs?" <> URI.encode_query(@criteria)
      assert url == expected
      {:ok, %{body: ""}} 
    end
    :ok
  end

  test "search with criteria" do
    {:ok, _} = Scraper.Indeed.search(@criteria)
  end
end
