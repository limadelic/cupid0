defmodule Scraper.IndeedTest do

  use ExUnit.Case

  import Mox

  test "finds developer jobs" do

    expect Scraper.HTTP, :get, fn url ->
      assert url == "https://www.indeed.com/jobs?q=dev"
      {:ok, %{body: ""}}
    end

    Scraper.Indeed.search "dev"

  end

end
