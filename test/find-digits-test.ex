defmodule FindDigitsTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.FindDigits.find(12) == 2
    assert HackerRank.FindDigits.find(1012) == 3
  end
end
