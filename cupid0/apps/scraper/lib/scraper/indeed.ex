defmodule Scraper.Indeed do

  @http Application.compile_env(:scraper, :http_client, HTTPoison)

  def search term do
    {:ok, %{body: html}} = @http.get "https://www.indeed.com/jobs?q=#{term}"
    html
    |> String.split("<job>")
    |> Enum.drop(1)
    |> Enum.map(&String.replace(&1, "</job>", ""))
  end

end
