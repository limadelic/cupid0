defmodule Scraper.IndeedTest do

  use ExUnit.Case

  test "finds developer jobs" do

    jobs = Scraper.Indeed.search "dev"
    assert length(jobs) > 0

  end

end
