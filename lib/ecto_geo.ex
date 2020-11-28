defmodule EctoGeo do
  # import Ecto.Query

  alias EctoGeo.POI
  alias EctoGeo.Repo

  @doc """
  Create a POI entry in the db.

  The use of a params map is done here to mimic our original
  bugged project as close as possible. There, the input comes
  from a web form POST handled by Phoenix.
  """
  def create_poi(params) do
    %POI{}
    |> POI.changeset(params)
    |> Repo.insert()
  end
end
