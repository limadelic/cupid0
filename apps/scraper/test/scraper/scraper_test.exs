defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "calls mock" do

    expect Scraper.MockHTTP, :get, fn url ->
      assert url == "https://www.indeed.com/jobs?q=dev"
      {:ok, %{}} 
    end

    Scraper.Indeed.search "dev"

  end

end
