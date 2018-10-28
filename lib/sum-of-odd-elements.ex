defmodule HackerRank.SumOfOddElements do
  def main() do
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.filter(fn x -> rem(2 + rem(x, 2), 2) == 1 end)
    |> Enum.sum
    |> IO.puts
  end
end
