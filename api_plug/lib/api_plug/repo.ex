defmodule ApiPlug.Repo do
  use Ecto.Repo,
    otp_app: :api_plug,
    adapter: Ecto.Adapters.SQLite3
end
