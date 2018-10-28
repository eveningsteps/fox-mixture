defmodule HackerRank.ListReplication do
  def out(_, 0) do
  end

  def out(s, times) do
    IO.puts(s)
    out(s, times - 1)
  end

  def replicate([], _) do
  end

  def replicate([head | tail], times) do
    out(head, times)
    replicate(tail, times)
  end

  def main() do
    n = IO.gets("") |> String.trim |> String.to_integer
    val = IO.read(:all) |> String.split("\n", trim: true)
    replicate(val, n)
  end
end
