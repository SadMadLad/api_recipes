defmodule ApiPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :api_phoenix,
    adapter: Ecto.Adapters.SQLite3
end
