defmodule Suitors.Features.InboxSteps do
  use Cabbage.Feature, file: "inbox.feature"
  
  defgiven ~r/^a new batch of suitors in the inbox$/, _state do
    :ok
  end
  
  defwhen ~r/^the inbox processor runs$/, _state do
    :ok
  end
  
  defthen ~r/^suitor IDs should be recorded$/, _state do
    :ok
  end
  
  defthen ~r/^the batch should move to the lobby$/, _state do
    :ok
  end
end
