defmodule Toltec.Repo do
  use Ecto.Repo,
    otp_app: :toltec,
    adapter: Ecto.Adapters.Postgres
end
