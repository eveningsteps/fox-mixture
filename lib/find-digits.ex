defmodule HackerRank.FindDigits do
  def find([], _) do
    0
  end

  def find([head | tail], n) when head == 0 do
    find(tail, n)
  end

  def find([head | tail], n) do
    case rem(n, head) do
      0 -> 1 + find(tail, n)
      _ -> find(tail, n)
    end
  end

  def find(n) do
    n |> Integer.digits() |> find(n)
  end

  def main() do
    v = IO.read(:line) |> String.trim() |> String.to_integer()
    for _ <- 0..v - 1 do
      IO.read(:line)
        |> String.trim()
        |> String.to_integer()
        |> find()
        |> IO.puts()
    end
  end
end
