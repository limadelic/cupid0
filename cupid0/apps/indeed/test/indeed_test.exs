defmodule IndeedTest do
  use ExUnit.Case
  doctest Indeed

  test "greets the world" do
    assert Indeed.hello() == :world
  end
end
