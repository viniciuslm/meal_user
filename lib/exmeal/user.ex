defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:cpf, :email, :name]
  @update_params @required_params

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :email]}

  schema "users" do
    field :cpf, :string
    field :email, :string
    field :name, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> changes(params, @required_params)
  end

  def changeset(user, params) do
    user
    |> changes(params, @update_params)
  end

  defp changes(user, params, fields) do
    user
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
