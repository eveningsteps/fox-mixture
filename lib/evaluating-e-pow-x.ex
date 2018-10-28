defmodule HackerRank.EvaluatingEPowX do
  def pow(x, n) when x == 0 or n == 0 do
    1
  end

  def pow(x, n) do
    x * pow(x, n - 1)
  end

  def fact(n) when n <= 1 do
    1.0
  end

  def fact(n) do
    n * fact(n - 1)
  end

  def e(x, n \\ 9)
  def e(x, n) when x == 0 or n == 0 do
    1.0
  end

  def e(x, n) do
    e(x, n - 1) + pow(x, n) / fact(n)
  end

  def main() do
    IO.gets("")
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(fn a -> Float.parse(a) |> elem(0) |> e |> Float.round(4) end)
    |> Enum.join("\n")
    |> IO.puts
  end
end
