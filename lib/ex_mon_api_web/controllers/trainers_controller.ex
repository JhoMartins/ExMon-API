defmodule ExMonApiWeb.TrainersController do
  use ExMonApiWeb, :controller

  def create(conn, params) do
    params
    |> ExMonApi.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", trainer)
  end

end
