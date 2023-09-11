defmodule ApiPhoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :dob, :date
    field :name, :string
    field :nationality, :string
    field :programming_language, :string
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :dob, :nationality, :programming_language])
    |> validate_required([:name, :age, :dob, :nationality, :programming_language])
  end
end
