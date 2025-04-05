defmodule Scraper.Indeed do

  @http Application.compile_env(:scraper, :http_client, HTTPoison)

  def search term do
    @http.get "https://www.indeed.com/jobs?q=#{term}"
  end

end
