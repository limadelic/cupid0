defmodule Bouncer.CabbageTest do
  use ExUnit.Case
  
  test "cabbage is installed" do
    # Just a dummy test to make sure cabbage is available
    assert Code.ensure_loaded?(Cabbage)
  end
end
