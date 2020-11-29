use Mix.Config

config :ecto_geo, EctoGeo.Repo,
  database: "ecto_geo",
  username: "ecto_geo",
  password: "ecto_geo",
  hostname: "0.0.0.0",
  pool: Ecto.Adapters.SQL.Sandbox
