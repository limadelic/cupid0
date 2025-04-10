defmodule Scraper.Features.IndeedJobsTest do
  use Cabbage.Feature, file: "indeed_jobs.feature"

  setup do
    {:ok, %{}}
  end

  defgiven ~r/^I want to search for remote software engineering jobs$/, _, _ do
    :ok
  end

  defwhen ~r/^I search with these criteria:$/, %{table: criteria}, state do
    
    search = for [field, value] <- criteria, into: [] do
      {String.to_atom(String.downcase(field)), value}
    end
    {:ok, jobs} = Scraper.Indeed.search search
    {:ok, Map.put(state, :jobs, jobs)}
  
  end


  defthen ~r/^I should get a list of matching job postings$/, _, _ do
    :ok
  end

  defthen ~r/^each job posting should have:$/, %{table: _fields}, _ do
    :ok
  end

end
