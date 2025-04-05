ExUnit.start()

Mox.defmock Scraper.HTTP, for: HTTPoison.Base
Application.put_env :scraper, :http_client, Scraper.HTTP
