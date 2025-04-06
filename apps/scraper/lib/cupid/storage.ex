defmodule Cupid.Storage do
  @moduledoc """
  💝 Storage for job opportunities waiting to find their perfect match.
  
  Each job is a heart waiting to be discovered by the right person.
  """

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    {:ok, :ets.new(:hearts, [:set, :protected, :named_table])}
  end
end
