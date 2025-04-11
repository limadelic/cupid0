defmodule Suitors.Hearts do
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

  def add(job) do
    GenServer.call(__MODULE__, {:add, job})
  end

  def all do
    GenServer.call(__MODULE__, :all)
  end

  def count do
    GenServer.call(__MODULE__, :count)
  end

  @impl true
  def handle_call({:add, job}, _from, table) do
    :ets.insert(table, {job.id, job})
    {:reply, :ok, table}
  end

  def handle_call(:all, _from, table) do
    jobs = :ets.tab2list(table) |> Enum.map(fn {_, job} -> job end)
    {:reply, jobs, table}
  end

  def handle_call(:count, _from, table) do
    count = :ets.info(table, :size)
    {:reply, count, table}
  end
end
