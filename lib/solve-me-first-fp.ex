defmodule HackerRank.SolveMeFirstFP do
  def read_integer() do
    IO.gets("") |> String.trim |> String.to_integer
  end

  def sum(a, b) do
    a + b
  end

  def main() do
    sum(read_integer(), read_integer()) |> IO.puts
  end
end
