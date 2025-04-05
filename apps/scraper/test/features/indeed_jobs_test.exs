defmodule Scraper.Examples.IndeedJobsTest do
  use Cabbage.Feature, async: false, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}} # Return initial state
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, state do
    {:ok, Map.put(state, :base_url, "https://www.indeed.com/jobs")}
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, state do
    position = Enum.find_value(criteria, fn row ->
      row["Position"]
    end)
    query = %{q: position}
    {:ok, Map.put(state, :query, query)}
  end

  defthen ~r/^I should get a list of matching job postings$/, _, state do
    {:ok, state}
  end

  defthen ~r/^each job posting should have:$/, %{table: fields}, state do
    {:ok, state}
  end
end
