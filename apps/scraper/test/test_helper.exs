ExUnit.start()
{:ok, _} = Application.ensure_all_started(:cabbage)

Code.require_file Path.join(__DIR__, "specs/indeed_spec.exs")

defmodule Scraper.HTTP do
  @callback get(String.t()) :: {:ok, map()} | {:error, term()}
  @callback get(String.t(), list()) :: {:ok, map()} | {:error, term()}
end

Mox.defmock Scraper.MockHTTP, for: Scraper.HTTP
