import Config

config :api_plug,
  ecto_repos: [ApiPlug.Repo]

config :api_plug, ApiPlug.Repo,
  database: "../api-database.db"
