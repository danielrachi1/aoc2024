defmodule Day1 do
  def part1() do
    {:ok, input_str} = File.read("static/day1.txt")

    input_str
    |> get_sorted_lists()
    |> Enum.zip_reduce(0, fn [l, r], acc -> acc + abs(l - r) end)
  end

  def get_sorted_lists(input_str) do
    input_str
    |> String.split("\n")
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn [l, r] -> [String.to_integer(l), String.to_integer(r)] end)
    |> Enum.zip()
    |> Enum.map(fn tuple -> Tuple.to_list(tuple) end)
    |> Enum.map(fn list -> Enum.sort(list) end)
  end
end
