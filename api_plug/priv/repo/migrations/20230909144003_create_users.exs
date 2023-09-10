defmodule ApiPlug.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :age, :integer, null: false
      add :dob, :date, null: false
      add :nationality, :string, null: false
      add :programming_language, :string, null: false, default: "elixir/plug"
    end
  end
end
