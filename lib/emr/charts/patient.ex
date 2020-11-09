defmodule Emr.Charts.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :age, :integer
    field :height, :integer
    field :name, :string
    field :sex, :string
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:name, :age, :sex, :height, :weight])
    |> validate_required([:name, :age, :sex, :height, :weight])
  end
end
