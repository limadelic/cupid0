defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "search_url returns a string" do
    assert is_binary(Scraper.Indeed.search_url())
  end
end
