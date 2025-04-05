defmodule Scraper.HTTP do
  @callback get(String.t()) :: {:ok, map()} | {:error, term()}
end
