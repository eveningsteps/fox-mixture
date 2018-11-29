defmodule HackerRank.StringReduction do
  def reduce([], _), do: []
  def reduce([head | tail], map) do
    case head in map do
      false -> [head | reduce(tail, MapSet.put(map, head))]
      true -> reduce(tail, MapSet.put(map, head))
    end
  end

  def reduce(str) do
    str |> String.to_charlist() |> reduce(MapSet.new()) |> List.to_string()
  end

  def main() do
    IO.read(:line)
      |> String.trim()
      |> reduce()
      |> IO.puts()
  end
end
