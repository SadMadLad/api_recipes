defmodule ApiPhoenixWeb.UserJSON do
  alias ApiPhoenix.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      dob: user.dob,
      nationality: user.nationality,
      programming_language: user.programming_language
    }
  end
end
