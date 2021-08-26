defmodule Squad3be.Repo do
  use Ecto.Repo,
    otp_app: :squad3be,
    adapter: Ecto.Adapters.Postgres
end
