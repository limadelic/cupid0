defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  @doc """
  Builds a search URL for Indeed with the given parameters.
  Params:
    - q: search term
    - l: location
  """
  def search_url params \\ [] do
    params
    |> query
    |> url
  end

  defp query params do
    %{
      q: param(params, :q),
      l: param(params, :l)
    }
  end

  defp param(params, key, default \\ ""), do: Keyword.get(params, key, default)

  defp url params do
    @base_url <> "/jobs?" <> URI.encode_query params
  end
end
