defmodule EctoGeo.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_geo,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EctoGeo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:ecto, "~> 3.5", override: true},
      {:myxql, git: "https://github.com/elixir-ecto/myxql", override: true},
      {:geo, "3.3.5", override: true}
    ]
  end

  defp aliases do
    [
      test: ["ecto.drop" , "ecto.create", "ecto.migrate", "test"]
    ]
  end
end
