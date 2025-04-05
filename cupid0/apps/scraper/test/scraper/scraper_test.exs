defmodule Scraper.IndeedTest do
  use ExUnit.Case

  test "view_job starts with indeed.com/viewjob" do
    url = Scraper.Indeed.view_job jk: "e3d5735de501774d"
    assert String.starts_with? url, "https://www.indeed.com/viewjob"
  end

  test "view_job includes job key" do
    url = Scraper.Indeed.view_job jk: "e3d5735de501774d"
    assert String.contains? url, "jk=e3d5735de501774d"
  end

  test "view_job includes company" do
    url = Scraper.Indeed.view_job jk: "e3d5735de501774d", cmp: "One-Inc"
    assert String.contains? url, "cmp=One-Inc"
  end
end
