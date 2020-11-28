defmodule EctoGeo.POI do
  use Ecto.Schema
  import Ecto.Changeset

  alias EctoGeo.Ecto.Geometry

  schema "pois" do
    field(:name, :string)
    field(:point, Geometry)
    timestamps()
  end

  def changeset(%__MODULE__{} = poi, attrs) do
    poi
    |> cast(attrs, [ :name, :point, ])
    |> validate_required([:name])
  end
end
