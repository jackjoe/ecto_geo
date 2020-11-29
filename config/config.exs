use Mix.Config

config :ecto_geo, ecto_repos: [EctoGeo.Repo]

config :ecto_geo, EctoGeo.Repo,
  database: "ecto_geo",
  username: "ecto_geo",
  password: "ecto_geo",
  hostname: "localhost",
  loggers: [Ecto.LogEntry]

import_config "#{Mix.env()}.exs"
