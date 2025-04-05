defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "calls indeed" do

    expect Scraper.HTTP, :get, fn _ ->
      {:ok, %{body: "ok"}}
    end

    Scraper.Indeed.search "dev"

  end

end
