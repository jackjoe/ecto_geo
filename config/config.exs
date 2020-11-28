use Mix.Config

config :ecto_geo, ecto_repos: [EctoGeo.Repo]

config :ecto_geo, EctoGeo.Repo,
  database: "ecto_geo",
  username: "jackjoe",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  loggers: [Ecto.LogEntry]

# config :hannibal, Hannibal.Repo,
#   pool: Ecto.Adapters.SQL.Sandbox,
#   ssl: true,
#   ssl_opts: [],
#   ownership_timeout: :infinity
