defmodule ExMOnApi.Trainer.CreateTest do
  use ExMonApi.DataCase

  alias ExMonApi.{Trainer, Repo}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "Jhonatan", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Jhonatan"}} = response
      assert count_after > count_before
    end

    test "when all there are invalid params, returns the error" do
      params = %{name: "Jhonatan"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
