defmodule Aoc2024Test do
  use ExUnit.Case
  doctest Aoc2024

  test "greets the world" do
    assert Aoc2024.hello() == :world
  end

  test "Day 1 part 1" do
    assert Day1.part1() == 1388114
  end
end
