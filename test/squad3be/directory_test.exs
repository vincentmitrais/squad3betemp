defmodule Squad3be.DirectoryTest do
  use Squad3be.DataCase

  alias Squad3be.Directory

  describe "user" do
    alias Squad3be.Directory.Users

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name", password_hash: "some password_hash", role: "some role", users: "some users"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", password_hash: "some updated password_hash", role: "some updated role", users: "some updated users"}
    @invalid_attrs %{first_name: nil, last_name: nil, password_hash: nil, role: nil, users: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_users()

      users
    end

    test "list_user/0 returns all user" do
      users = users_fixture()
      assert Directory.list_user() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Directory.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Directory.create_users(@valid_attrs)
      assert users.first_name == "some first_name"
      assert users.last_name == "some last_name"
      assert users.password_hash == "some password_hash"
      assert users.role == "some role"
      assert users.users == "some users"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Directory.update_users(users, @update_attrs)
      assert users.first_name == "some updated first_name"
      assert users.last_name == "some updated last_name"
      assert users.password_hash == "some updated password_hash"
      assert users.role == "some updated role"
      assert users.users == "some updated users"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_users(users, @invalid_attrs)
      assert users == Directory.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Directory.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Directory.change_users(users)
    end
  end
end
