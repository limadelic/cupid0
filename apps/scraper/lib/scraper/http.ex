defmodule Scraper.HTTP do

  @callback get(String.t) :: {:ok, term} | {:error, term}

end
