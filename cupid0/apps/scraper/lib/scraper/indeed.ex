defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  @doc """
  Builds a search URL for Indeed with the given parameters.
  Params:
    - q: search term
  """
  def search_url(params \\ []) do
    query_params = %{
      q: Keyword.get(params, :q, ""),
      l: Keyword.get(params, :l, "")
    }
    @base_url <> "/jobs?" <> URI.encode_query(query_params)
  end
end
