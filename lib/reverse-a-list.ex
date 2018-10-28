defmodule HackerRank.ReverseAList do
  def rev([]) do
    []
  end

  def rev([head | tail]) do
    rev(tail) ++ [head]
  end

  def main() do
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> rev
    |> Enum.map(&IO.puts/1)
  end
end
