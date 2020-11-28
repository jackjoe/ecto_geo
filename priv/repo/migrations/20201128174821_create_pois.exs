defmodule EctoGeo.Repo.Migrations.CreatePois do
  use Ecto.Migration

  def change do
    create table(:pois) do
      add(:name, :string)
      add(:point, :point, null: false)

      timestamps()
    end
  end
end
