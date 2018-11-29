defmodule FibonacciTest do
  use ExUnit.Case

  setup_all do
    HackerRank.Fibonacci.State.start_link()
    {:ok, %{}}
  end

  test "state" do
    assert HackerRank.Fibonacci.State.fib(3) == 2
    assert HackerRank.Fibonacci.State.fib(4) == 3
  end

  test "remainder" do
    assert HackerRank.Fibonacci.fib(100) == 24278230
  end
end
