defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:calories, :date, :description, :user_id]

  @derive {Jason.Encoder, only: [:id, :calories, :date, :description, :user_id]}

  schema "meals" do
    field :calories, :integer
    field :date, :date
    field :description, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(params, user \\ %__MODULE__{}) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
