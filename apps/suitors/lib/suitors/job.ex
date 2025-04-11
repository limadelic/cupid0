defmodule Suitors.Job do
  @moduledoc """
  A job opportunity waiting to find its perfect match.
  """

  @enforce_keys [:id, :title]
  defstruct [:id, :title, :company, :location, :salary, :description, :posted_at, :url]
end
