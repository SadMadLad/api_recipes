defmodule ApiPhoenix.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :dob, :date
      add :nationality, :string
      add :programming_language, :string, default: "elixir/phoenix"
    end
  end
end
