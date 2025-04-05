defmodule Scraper.IndeedTest do

  use ExUnit.Case

  @job %{
    key: "e3d5735de501774d",
    company: "One-Inc",
    title: "Software Engineer"
  }

  test "builds url" do

    url = view_url cmp: @job.company, t: @job.title
    [base, query] = String.split url, "?"

    assert base == "https://www.indeed.com/viewjob"
    assert param(query, :jk) == @job.key
    assert param(query, :cmp) == @job.company
    assert param(query, :t) == @job.title

  end

  defp view_url params do
    Scraper.Indeed.view_job [jk: @job.key] ++ params
  end

  defp param query, key do
    query
    |> String.split("&")
    |> Enum.find(& String.starts_with?(&1, "#{key}="))
    |> String.replace_prefix("#{key}=", "")
    |> URI.decode_www_form
  end

end
