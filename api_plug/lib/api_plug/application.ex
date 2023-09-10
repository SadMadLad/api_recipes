defmodule ApiPlug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      ApiPlug.Repo,
      {Plug.Cowboy, scheme: :http, plug: ApiPlug.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: ApiPlug.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
