defmodule ApiPhoenixWeb.UserControllerTest do
  use ApiPhoenixWeb.ConnCase

  import ApiPhoenix.AccountsFixtures

  alias ApiPhoenix.Accounts.User

  @create_attrs %{
    age: 42,
    dob: ~D[2023-09-10],
    name: "some name",
    nationality: "some nationality",
    programming_language: "some programming_language"
  }
  @update_attrs %{
    age: 43,
    dob: ~D[2023-09-11],
    name: "some updated name",
    nationality: "some updated nationality",
    programming_language: "some updated programming_language"
  }
  @invalid_attrs %{age: nil, dob: nil, name: nil, nationality: nil, programming_language: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/api/users")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "age" => 42,
               "dob" => "2023-09-10",
               "name" => "some name",
               "nationality" => "some nationality",
               "programming_language" => "some programming_language"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "age" => 43,
               "dob" => "2023-09-11",
               "name" => "some updated name",
               "nationality" => "some updated nationality",
               "programming_language" => "some updated programming_language"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, ~p"/api/users/#{user}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/users/#{user}")
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
