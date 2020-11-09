defmodule Emr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :provider_type, :string

      timestamps()
    end

  end
end
