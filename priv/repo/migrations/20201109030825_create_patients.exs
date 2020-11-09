defmodule Emr.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :name, :string
      add :age, :integer
      add :sex, :string
      add :height, :integer
      add :weight, :integer

      timestamps()
    end

  end
end
