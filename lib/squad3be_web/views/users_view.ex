defmodule Squad3beWeb.UsersView do
  use Squad3beWeb, :view
  alias Squad3beWeb.UsersView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      users: users.users,
      first_name: users.first_name,
      last_name: users.last_name,
      role: users.role,
      password_hash: users.password_hash}
  end
end
