defmodule Scraper.Indeed do

  @base_url "https://www.indeed.com"
  @path "/viewjob"

  def view_job params do
    params
    |> query
    |> url
  end

  defp query params do
    %{}
    |> Map.put(:jk, param(params, :jk))
    |> Map.put(:cmp, param(params, :cmp))
    |> Map.put(:t, param(params, :t))
  end

  defp param params, key do
    Keyword.get params, key, ""
  end

  defp url query do
    [@base_url, @path, "?", encode(query)]
    |> Enum.join
  end

  defp encode params do
    params
    |> Enum.map(fn {k, v} -> "#{k}=#{URI.encode_www_form v}" end)
    |> Enum.join("&")
  end

end
