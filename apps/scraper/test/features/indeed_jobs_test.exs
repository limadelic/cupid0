defmodule Scraper.Features.IndeedJobsTest do
  
  use Cabbage.Feature, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}}
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, _ do
    :ok
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, _ do
    term = wants(criteria, "Position")
    {:ok, %{body: html}} = Scraper.Indeed.get("https://www.indeed.com/jobs?q=#{term}")
    _title = Scraper.Indeed.parse_title(html)
    :ok
  end

  defthen ~r/^I should get a list of matching job postings$/, _, _ do
    :ok
  end

  defthen ~r/^each job posting should have:$/, %{table: _fields}, state do
    {:ok, state}
  end

  defp wants criteria, field do
    Enum.find_value(criteria, fn row -> row[field] end)
  end

end
