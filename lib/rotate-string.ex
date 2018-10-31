defmodule HackerRank.RotateString do
  def rotate(_, _, times) when times <= 0 do
    []
  end

  def rotate(enum, count, times) do
    val = enum
      |> Stream.drop(1)
      |> Stream.take(count)
      |> Enum.to_list()
    [
      val |
      enum
        |> Stream.drop(1)
        |> rotate(count, times - 1)
    ]
  end

  def rotate(str) when is_bitstring(str) do
    len = String.length(str)
    str
      |> String.to_charlist()
      |> Stream.cycle()
      |> rotate(len, len)
      |> Enum.join(" ")
  end

  def main() do
    n = IO.read(:line) |> String.trim() |> String.to_integer()
    for _ <- 0..n - 1 do
      IO.read(:line)
        |> String.trim()
        |> HackerRank.RotateString.rotate
        |> IO.puts
    end
  end
end
