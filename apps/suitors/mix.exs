defmodule Suitors.MixProject do
  use Mix.Project

  def project do
    [
      app: :suitors,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Suitors.Application, []}
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.4"},
      {:cabbage, "~> 0.4.1", only: :test}
    ]
  end
end
