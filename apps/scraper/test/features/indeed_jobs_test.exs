defmodule Scraper.Features.IndeedJobsTest do
  
  use Cabbage.Feature, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}}
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, state do
    {:ok, %{url: "https://www.indeed.com/jobs"}}
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, state do
    
    query = %{
      q: wants(criteria, "Position"),
      rbl: wants(criteria, "Work Type"),
      salaryType: wants(criteria, "Salary")
    }

    {:ok, Map.put(state, :query, query)}

  end

  defthen ~r/^I should get a list of matching job postings$/, _, state do
    {:ok, state}
  end

  defthen ~r/^each job posting should have:$/, %{table: _fields}, state do
    {:ok, state}
  end

  defp wants criteria, field do
    Enum.find_value(criteria, fn row -> row[field] end)
  end

end
