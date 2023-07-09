defmodule Issues.Print do
  @moduledoc """
  This module handles a lot of the functions for printing
  """
  @entries [:number, :created_at, :title]
  @num_entries length(@entries)

  def print_table(list) do
    elements = get_elements(list)
    sizes = get_sizes(elements)
    print_header(sizes)
    print_line(sizes)
    print_rows(elements, sizes)
  end

  def print_rows(elements, sizes) do
    elements
    |> Enum.each(&print_row(&1, sizes))
  end

  def print_row(element, sizes) do
    (get_column(element, :number, sizes, :left) <>
       "|" <>
       get_column(element, :created_at, sizes, :middle) <>
       "|"
       <>
       get_column(element, :title, sizes, :right)
       )
    |> IO.puts()
  end

  def get_column(element, field, sizes, :left) do
    val = element[field]
    size = sizes[field]
    String.pad_trailing("#{val}", size + 1)
  end

  def get_column(element, field, sizes, :middle) do
    val = element[field]
    size = sizes[field]
    String.pad_trailing(" #{val}", size + 2)
  end

  def get_column(element, field, sizes, :right) do
    val = element[field]
    size = sizes[field]
    String.pad_trailing(" #{val}", size + 1)
  end

  def print_header(sizes) do
    (get_header(" #", sizes[:number], :left) <>
       "|" <>
       get_header(" created_at", sizes[:created_at], :middle) <>
       "|" <>
       get_header(" title", sizes[:title], :right))
    |> IO.puts()
  end

  def get_header(header, size, :left) do
    header
    |> String.pad_trailing(size + 1)
  end

  def get_header(header, size, :middle) do
    header
    |> String.pad_trailing(size + 2)
  end

  def get_header(header, size, :right) do
    header
    |> String.pad_trailing(size + 1)
  end

  def print_line(sizes) do
    (String.pad_leading("+", sizes[:number] + 2, "-") <>
       String.pad_leading("+", sizes[:created_at] + 3, "-") <>
       String.pad_leading("", sizes[:title] + 1, "-"))
    |> IO.puts()
  end

  def get_elements(%{"number" => number, "created_at" => created_at, "title" => title}) do
    %{number: Integer.to_string(number), created_at: created_at, title: title}
  end

  def get_elements(list) do
    list
    |> Enum.map(&get_elements/1)
  end

  def strlen(elements, field) do
    elements
    |> Enum.map(fn e -> String.length(e[field]) end)
    |> Enum.max()
  end

  def get_sizes(elements) do
    %{
      number: strlen(elements, :number),
      created_at: strlen(elements, :created_at),
      title: strlen(elements, :title)
    }
  end

  # def print_table(list) do
  #   IO.pu
  # end
end
