defmodule Scraper.Indeed do
  @doc """
  Builds a search URL for Indeed with the given parameters.
  Params:
    - q: search term
  """
  def search_url(_params \\ []), do: ""
end
