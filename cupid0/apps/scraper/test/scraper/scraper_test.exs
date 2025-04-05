defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "views specific job posting" do

    url = Scraper.Indeed.view_job jk: "123", cmp: "inc", t: "dev"
    assert String.starts_with? url, "https://www.indeed.com/viewjob"
    assert String.contains? url, "cmp=inc&jk=123&t=dev"

  end

end
