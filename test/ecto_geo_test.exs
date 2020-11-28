defmodule EctoGeoTest do
  use ExUnit.Case
  doctest EctoGeo

  test "handles Geometry" do
    # incorrect lat/long for NY, but these values are used in original bugged application
    params = %{ "name" => "New York", "point" => "POINT(3.3657229000000033 50.75608189969242)" }
    {:ok, poi} = EctoGeo.create_poi(params)

    assert poi.name == "New York"
  end
end
