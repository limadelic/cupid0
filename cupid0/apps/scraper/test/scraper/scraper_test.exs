defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "search_url starts with indeed.com" do
    assert String.starts_with?(Scraper.Indeed.search_url(q: "elixir"), "https://www.indeed.com")
  end
end
