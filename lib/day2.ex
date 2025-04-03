defmodule Day2 do
  def part1() do
    {:ok, input_str} = File.read("priv/day2.txt")

    input_str
    |> parse()
    |> Enum.map(fn report ->
      diffs = compute_diffs(report)

      all_same_sign?(diffs) and all_in_range?(diffs)
    end)
    |> Enum.count(fn report_checked -> report_checked end)
  end

  def parse(input_str) do
    input_str
    |> String.split("\n")
    |> Enum.map(fn report -> String.split(report) end)
    |> Enum.map(fn report ->
      Enum.map(report, fn n -> String.to_integer(n) end)
    end)
  end

  def compute_diffs(report) do
    report
    |> Enum.with_index()
    |> Enum.map(fn {n, i} ->
      Enum.at(report, i - 1) - n
    end)
    |> Enum.drop(1)
  end

  def all_same_sign?([first_diff | diffs]) when first_diff >= 0 do
    Enum.all?(diffs, fn diff -> diff > 0 end)
  end

  def all_same_sign?([first_diff | diffs]) when first_diff < 0 do
    Enum.all?(diffs, fn diff -> diff < 0 end)
  end

  def all_in_range?(diffs) do
    Enum.all?(diffs, fn diff -> abs(diff) >= 1 and abs(diff) <= 3 end)
  end
end
