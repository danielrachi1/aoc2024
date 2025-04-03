defmodule Aoc2024Test do
  use ExUnit.Case
  doctest Aoc2024

  test "greets the world" do
    assert Aoc2024.hello() == :world
  end

  test "Day 1 part 1" do
    assert Day1.part1() == 1388114
  end

  test "Day 1 part 2" do
    assert Day1.part2() == 23529853
  end

  test "Day 2 part 1" do
    assert Day2.part1() == 218
  end
end
