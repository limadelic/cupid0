defmodule Scraper.HTTP do
  @callback get(String.t()) :: {:ok, map()} | {:error, term()}
end

defmodule Scraper.HTTPClient do
  @behaviour Scraper.HTTP

  def get(url) do
    HTTPoison.get(url)
  end
end
