defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  @doc """
  Builds a search URL for Indeed with the given parameters.
  Params:
    - q: search term
    - l: location
  """
  def search_url(params \\ []) do
    params
    |> query()
    |> url()
  end

  defp query(params) do
    %{
      q: Keyword.get(params, :q, ""),
      l: Keyword.get(params, :l, "")
    }
  end

  defp url(params) do
    @base_url <> "/jobs?" <> URI.encode_query(params)
  end
end
