defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "search_url accepts a search term" do
    assert is_binary(Scraper.Indeed.search_url(q: "elixir"))
  end
end
