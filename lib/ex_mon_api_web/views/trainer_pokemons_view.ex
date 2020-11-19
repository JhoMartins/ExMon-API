defmodule ExMonApiWeb.TrainerPokemonsView do
  use ExMonApiWeb, :view

  alias ExMonApi.Trainer.Pokemon

  def render("create.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at, nickname: nickname, types: types, trainer_id: trainer_id, weight: weigth}}) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weigth: weigth,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{pokemon: %Pokemon{id: id, name: name, inserted_at: inserted_at, nickname: nickname, types: types, trainer: %{id: trainer_id, name: trainer_name}, weight: weigth}}) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer: %{id: trainer_id, name: trainer_name},
        weigth: weigth,
        inserted_at: inserted_at
      }
    }
  end
end
