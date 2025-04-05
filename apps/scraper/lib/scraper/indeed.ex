defmodule Scraper.Indeed do
  @behaviour Scraper.HTTP

  def get(url) do
    http_client = Application.get_env(:scraper, :http_client)
    http_client.get(url)
  end

  def search term do
    http_client = Application.get_env(:scraper, :http_client)
    {:ok, %{body: json}} = http_client.get "https://www.indeed.com/jobs?q=#{term}"
    {:ok, Jason.decode! json}
  end

end
