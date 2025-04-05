defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "uses mock" do

    expect Scraper.HTTP, :get, fn _ ->
      {:ok, %{status_code: 200}} 
    end

    Scraper.Indeed.search "dev"

  end

end
