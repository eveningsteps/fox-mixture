defmodule BinaryNumbersTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.BinaryNumbers.maximal(5) == 1
    assert HackerRank.BinaryNumbers.maximal(13) == 2
  end
end
