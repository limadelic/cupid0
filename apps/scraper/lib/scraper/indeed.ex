defmodule Scraper.Indeed do

  @behaviour Scraper.HTTP

  def get url do

    http_client().get url

  end

  def search term do
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
