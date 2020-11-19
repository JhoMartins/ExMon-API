defmodule ExMonApi.Controllers.TrainersControllerTest do
  use ExMonApiWeb.ConnCase

  alias ExMonApi.Trainer

  describe "show/2" do
    test "when there is a trainer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "Jhonatan", password: "123456"}

      {:ok, %Trainer{id: id}} = ExMonApi.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Jhonatan"} = response
    end

    test "when there is an error, returns the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, 12345))
        |> json_response(:bad_request)

        expected_response = %{"message" => "Invalid ID format!"}

      assert response == expected_response
    end
  end
end
