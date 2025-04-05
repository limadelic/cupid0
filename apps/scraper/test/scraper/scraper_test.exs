defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "gets response" do

    expect Scraper.HTTP, :get, fn _ ->
      {:ok, %{body: "ok"}} 
    end

    response = Scraper.Indeed.search "dev"
    assert is_binary(response)

  end

end
