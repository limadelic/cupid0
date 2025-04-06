import Config

config :scraper, :http_client, Scraper.MockHTTP
config :logger, level: :error
