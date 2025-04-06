defmodule Scraper.Indeed do
  
  @behaviour Scraper.HTTP

  def get url do
    
    http_client().get url

  end

  def search(criteria) when is_list(criteria) do
    
    query = URI.encode_query(criteria)
    {:ok, %{body: _}} = get "https://www.indeed.com/jobs?#{query}"
    {:ok, []}

  end

  def parse_title html do
    
    [_, title] = Regex.run ~r/<title>(.*?) - /, html
    title

  end

  defp http_client do
    
    Application.get_env :scraper, :http_client

  end

end
