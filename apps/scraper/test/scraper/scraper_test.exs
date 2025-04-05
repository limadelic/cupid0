defmodule Scraper.IndeedTest do

  use ExUnit.Case
  import Mox

  test "gets three jobs" do
    expect Scraper.MockHTTP, :get, fn _ ->
      {:ok, %{body: "[{},{},{}]"}} 
    end

    {:ok, jobs} = Scraper.Indeed.search "dev"
    assert length(jobs) == 3
  end

end
