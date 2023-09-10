defmodule ApiPlug.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_plug,
      version: "0.1.0",
      elixir: "~> 1.16-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ApiPlug.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.14"},
      {:plug_cowboy, "~> 2.0"},
      {:ecto_sql, "~> 3.2"},
      {:ecto_sqlite3, "~> 0.11"},
      {:jason, "~> 1.4"}
    ]
  end
end
