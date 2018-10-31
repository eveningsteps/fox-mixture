defmodule StringOPermuteTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.StringOPermute.permute([]) == []
    assert HackerRank.StringOPermute.permute([1, 2, 3, 4]) == [2, 1, 4, 3]
  end
end
