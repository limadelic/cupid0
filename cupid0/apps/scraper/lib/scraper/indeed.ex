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
    |> Map.put(:jk, get(params, :jk))
    |> Map.put(:cmp, get(params, :cmp))
    |> Map.put(:t, get(params, :t))
  end

  defp get params, key do
    Keyword.get params, key, ""
  end

  defp url query do
    parts = [
      @base_url,
      @path,
      "?",
      encode(query)
    ]
    Enum.join parts
  end

  defp encode params do
    params
    |> Enum.map(&encode_param/1)
    |> Enum.join("&")
  end

  defp encode_param {key, value} do
    "#{key}=#{URI.encode_www_form value}"
  end

end
