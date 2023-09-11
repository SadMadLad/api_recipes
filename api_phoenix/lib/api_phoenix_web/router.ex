defmodule ApiPhoenixWeb.Router do
  use ApiPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiPhoenixWeb do
    pipe_through :api

    resources "/users", UserController
  end
end
