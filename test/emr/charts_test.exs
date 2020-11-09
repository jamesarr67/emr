defmodule Emr.ChartsTest do
  use Emr.DataCase

  alias Emr.Charts

  describe "patients" do
    alias Emr.Charts.Patient

    @valid_attrs %{age: 42, height: 42, name: "some name", sex: "some sex", weight: 42}
    @update_attrs %{age: 43, height: 43, name: "some updated name", sex: "some updated sex", weight: 43}
    @invalid_attrs %{age: nil, height: nil, name: nil, sex: nil, weight: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Charts.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Charts.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Charts.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Charts.create_patient(@valid_attrs)
      assert patient.age == 42
      assert patient.height == 42
      assert patient.name == "some name"
      assert patient.sex == "some sex"
      assert patient.weight == 42
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Charts.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Charts.update_patient(patient, @update_attrs)
      assert patient.age == 43
      assert patient.height == 43
      assert patient.name == "some updated name"
      assert patient.sex == "some updated sex"
      assert patient.weight == 43
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Charts.update_patient(patient, @invalid_attrs)
      assert patient == Charts.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Charts.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Charts.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Charts.change_patient(patient)
    end
  end
end
