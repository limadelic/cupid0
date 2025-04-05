import Config

config :scraper, :http_client, HTTPoison

import_config "#{config_env()}.exs"
