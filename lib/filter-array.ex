defmodule HackerRank.FilterArray do
  def filter([], _) do
    []
  end

  def filter([head | tail], predicate) do
    if predicate.(head) do
      [head] ++ filter(tail, predicate)
    else
      filter(tail, predicate)
    end
  end

  def main() do
    b = IO.gets("")
    |> String.trim
    |> String.to_integer

    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> filter(fn a -> a < b end)
    |> Enum.join("\n")
    |> IO.puts
  end
end
