defmodule SpecsTest do
  use ExUnit.Case
  doctest Specs

  test "greets the world" do
    assert Specs.hello() == :world
  end
end
