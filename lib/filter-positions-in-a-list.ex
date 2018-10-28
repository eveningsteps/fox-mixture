defmodule HackerRank.FilterPositionsInAList do
  def filter(list, print \\ false)
  def filter([], _) do
  end

  def filter([head | tail], print) do
    if print do
      IO.puts head
    end
    filter(tail, not print)
  end

  def main() do
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> filter
  end
end
