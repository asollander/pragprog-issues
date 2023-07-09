defmodule Issues do
  @moduledoc """
  Documentation for `Issues`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Issues.hello()
      :world

  """
  def hello do
    :world
  end

    @doc """
  Get config

  ## Examples

      iex> Issues.show_config()
      [url: "https://api.github.com"]

  """
  def show_config do
    Application.get_env(:issues, Github)
    |> IO.inspect(label: ":issues, Github")
  end

end
