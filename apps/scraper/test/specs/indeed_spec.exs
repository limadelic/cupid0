defmodule Scraper.IndeedSpec do

  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  setup do

    Application.put_env :scraper, :http_client, Scraper.MockHTTP
    :ok

  end

  test "search with all criteria" do

    {:ok, _} = Scraper.Indeed.search [
      %{"Position" => "software engineer"},
      %{"Work Type" => "Remote"},
      %{"Salary" => "$135,000+"},
      %{"Posted Within" => "Last 24 hours"},
      %{"Sort By" => "Date"}
    ]

    assert_received {:get, "https://www.indeed.com/jobs?q=software+engineer&l=Remote&salary=$135,000&fromage=1&sort=date"}

  end

end
