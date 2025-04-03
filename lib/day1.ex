defmodule Day1 do
  def get_sorted_lists(input_str) do
    input_str
    |> String.split("\n")
    |> Enum.map(fn line -> String.split(line) end)
    |> Enum.map(fn [l, r] -> [String.to_integer(l), String.to_integer(r)] end)
    |> Enum.zip()
    |> Enum.map(fn tuple -> Tuple.to_list(tuple) end)
    |> Enum.map(fn list -> Enum.sort(list) end)
  end

  def part1() do
    {:ok, input_str} = File.read("priv/day1.txt")

    input_str
    |> get_sorted_lists()
    |> Enum.zip_reduce(0, fn [l, r], acc -> acc + abs(l - r) end)
  end

  def part2() do
    {:ok, input_str} = File.read("priv/day1.txt")

    [l, r] = get_sorted_lists(input_str)

    Enum.reduce(l, 0, fn n, acc -> acc + n * Enum.count(r, fn x -> x == n end) end)
  end
end
