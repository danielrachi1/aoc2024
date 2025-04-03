defmodule Day3 do
  def part1() do
    {:ok, input_str} = File.read("priv/day3.txt")

    input_str
    |> parse()
    |> Enum.reduce(0, fn [left, right], acc -> acc + left * right end)
  end

  defp parse(input_str) do
    Regex.scan(~r"mul\(\d+,\d+\)", input_str)
    |> Enum.map(fn [mul] ->
      Regex.scan(~r"\d+", mul)
      |> Enum.map(fn [num] ->
        String.to_integer(num)
      end)
    end)
  end
end
