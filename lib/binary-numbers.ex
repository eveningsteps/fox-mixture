defmodule HackerRank.BinaryNumbers do
  def maximal([], _) do
    0
  end

  def maximal([head | tail], acc) do
    case head do
      0 -> max(acc, maximal(tail, 0))
      1 -> max(acc + 1, maximal(tail, acc + 1))
    end
  end

  def maximal(s) when is_list(s) do
    maximal(s, 0)
  end

  def maximal(s) when is_integer(s) do
    s |> Integer.digits(2) |> maximal(0)
  end

  def main() do
    IO.read(:line)
      |> String.trim()
      |> String.to_integer()
      |> Integer.digits(2)
      |> maximal()
      |> IO.puts()
  end
end
