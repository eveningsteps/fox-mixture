defmodule HackerRank.StringMingling do
  def mingle([], []) do
    []
  end

  def mingle([h1 | t1], [h2 | t2]) do
    [h1, h2] ++ mingle(t1, t2)
  end

  def main() do
    [s1, s2] = IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_charlist/1)

    mingle(s1, s2)
    |> IO.puts
  end
end
