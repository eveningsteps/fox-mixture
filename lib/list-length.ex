defmodule HackerRank.ListLength do
  def counter([]) do
    0
  end

  def counter([_ | tail]) do
    1 + counter(tail)
  end

  def main() do
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> counter
    |> IO.puts
  end
end
