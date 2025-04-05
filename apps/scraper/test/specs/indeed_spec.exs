defmodule Scraper.IndeedSpec do
  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  setup do
    Application.put_env :scraper, :http_client, Scraper.MockHTTP
    :ok
  end

  test "gets three jobs" do
    expect Scraper.MockHTTP, :get, fn _url ->
      {:ok, %{body: "[{},{},{}]"}} 
    end

    {:ok, jobs} = Scraper.Indeed.search "dev"
    assert length(jobs) == 3
  end
end
