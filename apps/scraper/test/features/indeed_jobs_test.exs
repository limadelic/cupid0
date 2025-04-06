defmodule Scraper.Features.IndeedJobsTest do
  use Cabbage.Feature, async: false, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}}
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, state do
    {:ok, %{url: "https://www.indeed.com/jobs"}}
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, state do
    position = Enum.find_value(criteria, fn row ->
      row["Position"]
    end)
    work_type = Enum.find_value(criteria, fn row ->
      row["Work Type"]
    end)
    salary = Enum.find_value(criteria, fn row ->
      row["Salary"]
    end)
    {:ok, Map.put(state, :query, %{q: position, rbl: work_type, salaryType: salary})}
  end

  defthen ~r/^I should get a list of matching job postings$/, _, state do
    {:ok, state}
  end

  defthen ~r/^each job posting should have:$/, %{table: _fields}, state do
    {:ok, state}
  end
end
