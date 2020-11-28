defmodule EctoGeo.Repo do
  use Ecto.Repo,
    otp_app: :ecto_geo,
    adapter: Ecto.Adapters.MyXQL
end
