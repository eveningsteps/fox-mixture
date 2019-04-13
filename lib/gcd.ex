defmodule HackerRank.GCD do
  def gcd(a, b) do
    cond do
      a == b -> a
      a > b -> gcd(a - b, a)
      a < b -> gcd(b - a, a)
    end
  end

  def main() do
    [a, b] = IO.read(:all)
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    gcd(a, b) |> IO.puts()
  end
end
