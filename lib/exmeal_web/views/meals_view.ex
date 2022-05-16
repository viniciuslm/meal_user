defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view
  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meals: %{
        meal: meal
      }
    }
  end

  def render("delete.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  def render("show.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

  def render("update.json", %{meal: %Meal{} = meal}) do
    %{
      message: "User updated!",
      meal: meal
    }
  end
end
