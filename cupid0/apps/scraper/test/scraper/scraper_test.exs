defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "search_url starts with indeed.com" do
    assert String.starts_with?(Scraper.Indeed.search_url(q: "elixir"), "https://www.indeed.com")
  end

  test "search_url includes /jobs path" do
    assert String.contains?(Scraper.Indeed.search_url(q: "elixir"), "/jobs")
  end
end
