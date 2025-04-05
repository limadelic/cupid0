defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  @doc """
  Builds a search URL for Indeed with the given parameters.
  Params:
    - q: search term
  """
  def search_url(_params \\ []), do: @base_url
end
