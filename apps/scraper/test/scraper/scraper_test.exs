defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "gets ok" do

    expect Scraper.MockHTTP, :get, fn _ ->
      {:ok, %{}} 
    end

    assert {:ok, _} = Scraper.Indeed.search "dev"

  end

end
