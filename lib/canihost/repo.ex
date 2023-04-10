defmodule Canihost.Repo do
  use Ecto.Repo,
    otp_app: :canihost,
    adapter: Ecto.Adapters.SQLite3
end
