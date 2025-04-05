defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "search jobs" do

    url = Scraper.Indeed.search jk: "123", cmp: "inc", t: "dev"
    assert String.starts_with? url, "https://www.indeed.com/jobs"
    assert String.contains? url, "cmp=inc&jk=123&t=dev"

  end

end
