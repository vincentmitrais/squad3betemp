defmodule Squad3be.Directory.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :role, :string
    field :users, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:users, :first_name, :last_name, :role, :password_hash])
    |> validate_required([:users, :first_name, :last_name, :role, :password_hash])
  end
end
