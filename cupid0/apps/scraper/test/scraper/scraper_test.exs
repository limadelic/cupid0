defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "search returns list" do
    assert is_list Scraper.Indeed.search "dev"
  end

end
