defmodule DivisibleSumPairsTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.DivisibleSumPairs.divisible([1, 3, 2, 6, 1, 2], 3) == 5
  end
end
