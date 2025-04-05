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
    |> build_query_params()
    |> build_url()
  end

  defp build_query_params(params) do
    %{
      q: Keyword.get(params, :q, ""),
      l: Keyword.get(params, :l, "")
    }
  end

  defp build_url(query_params) do
    @base_url <> "/jobs?" <> URI.encode_query(query_params)
  end
end
