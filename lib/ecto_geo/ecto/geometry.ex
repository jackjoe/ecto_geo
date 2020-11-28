defmodule EctoGeo.Ecto.Geometry do
  use Ecto.Type

  def type, do: :geometry

  # Used when you call Ecto.Changeset.cast/3
  def cast(wkt), do: Geo.WKT.decode(wkt)

  # loading data from the database
  def load(data), do: {:ok, data}

  # dumping data to the database
  def dump(%Geo.Point{} = value), do: {:ok, value}
  def dump(%Geo.Polygon{} = value), do: {:ok, value}
  def dump(%Geo.MultiPolygon{} = value), do: {:ok, value}

  # def dump(val), do: val
  def dump(_), do: :error
end
