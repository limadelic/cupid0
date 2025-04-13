defmodule BouncerTest do
  use ExUnit.Case
  doctest Bouncer

  test "greets the world" do
    assert Bouncer.hello() == :world
  end
end
