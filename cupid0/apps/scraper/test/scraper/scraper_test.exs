defmodule Scraper.IndeedTest do

  use ExUnit.Case

  @job [
    jk: "e3d5735de501774d",
    cmp: "One-Inc",
    t: "Software Engineer"
  ]

  test "builds indeed search url" do

    url = Scraper.Indeed.view_job @job
    [base, query] = String.split url, "?"

    assert base == "https://www.indeed.com/viewjob"
    for {key, value} <- @job do
      assert param(query, key) == value
    end

  end

  defp param query, key do
    ~r/#{key}=([^&]*)/
    |> Regex.run(query)
    |> List.last
    |> URI.decode_www_form
  end

end
