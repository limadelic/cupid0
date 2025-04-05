defmodule Scraper.Indeed do
  @behaviour Scraper.HTTP

  @http Application.compile_env(:scraper, :http_client)

  def get(url), do: @http.get(url)

  def search term do
    {:ok, %{body: json}} = @http.get "https://www.indeed.com/jobs?q=#{term}"
    {:ok, Jason.decode! json}
  end

end
