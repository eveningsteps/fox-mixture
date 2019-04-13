defmodule HackerRank.GCD.Test do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.GCD.gcd(1, 5) == 1
    assert HackerRank.GCD.gcd(100, 10) == 10
    assert HackerRank.GCD.gcd(100, 10) == HackerRank.GCD.gcd(10, 100)
    assert HackerRank.GCD.gcd(22, 131) == 1
  end
end
