defmodule HackerRank.FibonacciNumbers do
  def fib(n) do
    case n do
      1 -> 0
      2 -> 1
      _ -> fib(n - 1) + fib(n - 2)
    end
  end

  def main() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> fib
    |> IO.puts
  end
end
