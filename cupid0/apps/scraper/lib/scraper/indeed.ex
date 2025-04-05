defmodule Scraper.Indeed do

  @base_url "https://www.indeed.com"

  def view_job params \\ [] do
    params
    |> query
    |> url
  end

  defp query params do
    %{
      jk: param(params, :jk),
      cmp: param(params, :cmp),
      t: param(params, :t)
    }
  end

  defp param params, key, default \\ "" do
    Keyword.get params, key, default
  end

  defp url params do
    @base_url <> "/viewjob?" <> URI.encode_query params
  end
end
