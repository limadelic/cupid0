ExUnit.start()
{:ok, _} = Application.ensure_all_started(:cabbage)

Mox.defmock Scraper.MockHTTP, for: Scraper.HTTP
