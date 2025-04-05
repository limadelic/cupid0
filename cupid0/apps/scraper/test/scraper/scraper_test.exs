defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "search for jobs" do

    url = Scraper.Indeed.search q: "dev"
    assert String.starts_with? url, "https://www.indeed.com/jobs"
    assert String.contains? url, "q=dev"

  end

end
