defmodule Cupid.Features.StorageSteps do
  use Cabbage.Feature, file: "storage.feature"

  defwhen ~r/^jobs.json is imported into storage$/, _state do
    :ok
  end

  defthen ~r/^Cupid sees (\d+) jobs$/, %{captures: [count]}, _state do
    assert Cupid.Storage.count() == String.to_integer(count)
  end
end
