defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "calls indeed url" do

    expect Scraper.HTTP, :get, fn url ->
      assert url == "https://www.indeed.com/jobs?q=dev"
      {:ok, %{}} 
    end

    Scraper.Indeed.search "dev"

  end

end
