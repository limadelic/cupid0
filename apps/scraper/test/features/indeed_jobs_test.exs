defmodule Scraper.Features.IndeedJobsTest do
  
  use Cabbage.Feature, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}}
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, _ do
    :ok
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, state do
    term = wants(criteria, "Position")
    {:ok, jobs} = Scraper.Indeed.search(term)
    {:ok, Map.put(state, :jobs, jobs)}
  end

  defp wants criteria, field do
    Enum.find_value(criteria, fn row -> row[field] end)
  end

  defthen ~r/^I should get a list of matching job postings$/, _, _ do
    :ok
  end

  defthen ~r/^each job posting should have:$/, %{table: _fields}, _ do
    :ok
  end

end
