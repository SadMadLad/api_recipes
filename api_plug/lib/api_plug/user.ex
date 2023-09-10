defmodule ApiPlug.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ApiPlug.Repo

  @user_params [:name, :age, :dob, :nationality, :programming_language]
  @derive {Jason.Encoder, only: @user_params}

  schema "users" do
    field :name, :string
    field :age, :integer
    field :dob, :date
    field :nationality, :string
    field :programming_language, :string, default: "elixir/plug"
  end

  def all, do: ApiPlug.User |> Repo.all

  def find(id), do: ApiPlug.User |> Repo.get(id)

  def create(params) do
    %ApiPlug.User{}
    |> cast(params, @user_params)
    |> Repo.insert()
  end

  def update(user, params) do
    atomic_params = params |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
    user
    |> change(atomic_params)
    |> Repo.update
  end

  def destroy(user), do: user |> Repo.delete
end
