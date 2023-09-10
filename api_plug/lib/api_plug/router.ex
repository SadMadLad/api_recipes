defmodule ApiPlug.Router do
  use Plug.Router

  alias ApiPlug.User

  plug :match
  plug :dispatch

  get "/users" do
    send_resp(conn, 200, Jason.encode!(User.all))
  end

  get "/user/:id" do
    user = User.find(conn.params["id"])
    send_resp(conn, 200, Jason.encode!(user))
  end

  post "/users" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    user_params = Jason.decode! body
    User.create user_params
    send_resp(conn, 200, Jason.encode!(user_params))
  end

  patch "/user/:id" do
    user = User.find(conn.params["id"])
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    user_params = Jason.decode! body
    User.update(user, user_params)
    send_resp(conn, 200, Jason.encode!(user_params))
  end

  delete "/user/:id" do
    user = User.find(conn.params["id"])
    User.destroy user
    send_resp(conn, 200, "User deleted")
  end

  match _ do
    send_resp(conn, 404, "Not Found!")
  end
end
