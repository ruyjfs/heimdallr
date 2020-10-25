defmodule Heimdallr.Repo do
  use Ecto.Repo,
    otp_app: :heimdallr,
    adapter: Ecto.Adapters.Postgres
end
