defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "gets job by url" do

    url = "https://www.indeed.com/viewjob?cmp=One-Inc&t=Software+Engineer&jk=e3d5735de501774d"
    {:ok, job} = Scraper.Indeed.get url
    assert job.body != nil

  end

end
