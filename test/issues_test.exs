defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues

  test "greets the world" do
    assert Issues.hello() == :world
  end

  test "showing the config" do
    assert is_list(Issues.show_config())
  end
end
