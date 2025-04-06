ExUnit.start()
{:ok, _} = Application.ensure_all_started(:cabbage)

Code.require_file Path.join(__DIR__, "specs/indeed_spec.exs")

Mox.defmock Scraper.MockHTTP, for: Scraper.HTTP
