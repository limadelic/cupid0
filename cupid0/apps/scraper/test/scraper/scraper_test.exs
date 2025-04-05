defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "search_url starts with indeed.com" do
    assert String.starts_with?(Scraper.Indeed.search_url(q: "elixir"), "https://www.indeed.com")
  end

  test "search_url includes /jobs path" do
    assert String.contains?(Scraper.Indeed.search_url(q: "elixir"), "/jobs")
  end

  test "search_url includes query parameter" do
    url = Scraper.Indeed.search_url(q: "elixir")
    assert String.contains?(url, "q=elixir")
  end

  test "search_url encodes query parameters" do
    url = Scraper.Indeed.search_url(q: "elixir developer")
    assert String.contains?(url, "q=elixir+developer")
  end

  test "search_url includes location parameter" do
    url = Scraper.Indeed.search_url(q: "elixir", l: "Remote")
    assert String.contains?(url, "l=Remote")
  end

  test "search_url works with empty parameters" do
    url = Scraper.Indeed.search_url
    assert url == "https://www.indeed.com/jobs?q=&l="
  end

  test "search returns a response" do
    assert {:ok, _body} = Scraper.Indeed.search q: "elixir"
  end
end
