defmodule Scraper.IndeedSpec do
  use ExUnit.Case

  describe "get job" do
    test "fetches job details" do
      url = "https://www.indeed.com/viewjob?jk=e3d5735de501774d"
      {:ok, job} = Scraper.Indeed.get url
      assert job.body =~ ~r/Software Engineer/
    end
  end
end
