defmodule Bouncer.FeatureTest do
  use Cabbage.Feature, file: "bouncer.feature"
  use ExUnit.Case

  defgiven ~r/^I am at the door$/, _vars, _state do
    {:ok, %{}}
  end

  defwhen ~r/^the bouncer greets me$/, _vars, state do
    {:ok, state}
  end

  defthen ~r/^I should be asked for ID$/, _vars, _state do
    assert true
  end
end
