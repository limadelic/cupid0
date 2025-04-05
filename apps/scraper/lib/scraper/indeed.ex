defmodule Scraper.Indeed do

  @behaviour Scraper.HTTP

  def get url do

    http_client().get url

  end

  def search term do

    {:ok, %{body: json}} = http_client().get "https://www.indeed.com/jobs?q=#{term}"
    {:ok, Jason.decode! json}

  end

  defp http_client do

    Application.get_env :scraper, :http_client

  end

end
