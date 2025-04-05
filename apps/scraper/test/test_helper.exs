ExUnit.start()

Mox.defmock Scraper.MockHTTP, for: Scraper.HTTP
Application.put_env :scraper, :http_client, Scraper.MockHTTP
