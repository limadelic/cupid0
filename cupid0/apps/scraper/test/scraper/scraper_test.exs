defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "view job url" do
    # Given a job with key, company and title
    job = [
      jk: "e3d5735de501774d",
      cmp: "One-Inc",
      t: "Software Engineer"
    ]

    # When viewing the job
    url = Scraper.Indeed.view_job job

    # Then url should start with indeed viewjob
    assert String.starts_with? url, "https://www.indeed.com/viewjob"

    # And include all job params
    assert has? url, :jk, "e3d5735de501774d"
    assert has? url, :cmp, "One-Inc"
    assert has? url, :t, "Software Engineer"
  end

  defp has? url, key, value do
    String.contains? url, "#{key}=#{URI.encode_www_form value}"
  end

end
