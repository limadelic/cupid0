defmodule Scraper.IndeedSpec do
  use ExUnit.Case

  test "parses job title from html" do
    html = "<title>Software Engineer - One Inc</title>"
    assert Scraper.Indeed.parse_title(html) == "Software Engineer"
  end
end
