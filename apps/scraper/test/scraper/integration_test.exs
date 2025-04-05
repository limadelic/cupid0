defmodule Scraper.IntegrationTest do

  use ExUnit.Case

  test "gets indeed job page" do

    url = "https://www.indeed.com/viewjob?jk=e3d5735de501774d"
    assert {:ok, _} = Scraper.Indeed.get url

  end

end
