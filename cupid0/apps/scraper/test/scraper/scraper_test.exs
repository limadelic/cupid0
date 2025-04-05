defmodule Scraper.IndeedTest do

  use ExUnit.Case
  @job_key "e3d5735de501774d"
  @base_url "https://www.indeed.com/viewjob"

  test "builds url" do

    url = view_url cmp: "One-Inc", t: "Software Engineer"

    assert String.starts_with? url, @base_url
    assert has_param? url, :jk, @job_key
    assert has_param? url, :cmp, "One-Inc"
    assert has_param? url, :t, "Software Engineer"

  end

  defp view_url params do
    Scraper.Indeed.view_job [jk: @job_key] ++ params
  end

  defp has_param? url, key, value do
    String.contains? url, "#{key}=#{URI.encode_www_form value}"
  end

end
