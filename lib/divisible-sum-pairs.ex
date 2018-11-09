defmodule HackerRank.DivisibleSumPairs do
  def divisible(_, [], _) do
    0
  end

  def divisible(first, [head | tail], k) do
    case rem(first + head, k) do
      0 -> 1 + divisible(first, tail, k)
      _ -> divisible(first, tail, k)
    end
  end

  def divisible([], _) do
    0
  end

  def divisible([head | tail], k) do
    divisible(head, tail, k) + divisible(tail, k)
  end

  def main() do
    [_, k] = IO.read(:line)
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    IO.read(:line)
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> divisible(k)
      |> IO.puts()
  end
end
