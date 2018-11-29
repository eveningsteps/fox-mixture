defmodule StringReductionTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.StringReduction.reduce("accabb") == "acb"
    assert HackerRank.StringReduction.reduce("abc") == "abc"
    assert HackerRank.StringReduction.reduce("pprrqq") == "prq"
  end
end
