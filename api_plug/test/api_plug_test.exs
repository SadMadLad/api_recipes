defmodule ApiPlugTest do
  use ExUnit.Case
  doctest ApiPlug

  test "greets the world" do
    assert ApiPlug.hello() == :world
  end
end
