defmodule ApiPhoenix.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiPhoenix.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        dob: ~D[2023-09-10],
        name: "some name",
        nationality: "some nationality",
        programming_language: "some programming_language"
      })
      |> ApiPhoenix.Accounts.create_user()

    user
  end
end
