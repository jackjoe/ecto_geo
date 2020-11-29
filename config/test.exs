use Mix.Config

config :ecto_geo, EctoGeo.Repo,
  # database: "ecto_geo",
  # username: "ecto_geo",
  # password: "ecto_geo",
  # hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
