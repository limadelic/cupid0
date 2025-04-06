defmodule Scraper.IndeedSpec do

  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  setup do

    stub Scraper.MockHTTP, :get, fn _ -> {:ok, %{body: ""}} end
    :ok

  end

  test "search with criteria" do

    {:ok, _} = Scraper.Indeed.search(
      position: "software engineer",
      work_type: "Remote",
      salary: "$135,000+",
      posted: "Last 24 hours",
      sort: "Date"
    )

  end

end
