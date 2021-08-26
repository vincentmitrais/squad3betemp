defmodule Squad3be.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :users, :string
      add :first_name, :string
      add :last_name, :string
      add :role, :string
      add :password_hash, :string

      timestamps()
    end

  end
end
