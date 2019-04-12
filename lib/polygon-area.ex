defmodule HackerRank.PolygonArea do
  defp cross_product(a, b) do
    elem(a, 0) * elem(b, 1) - elem(b, 0) * elem(a, 1)
  end

  defp apply_cross([a, b | tail]) do
    cross = cross_product(a, b)
    case tail do
      [] -> cross
      _ -> cross + apply_cross([b | tail])
    end
  end

  def area(points) do
    0.5 * abs(apply_cross(points ++ [hd(points)]))
  end

  defp make_point(s) do
    s
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
  end

  def main() do
    _ = IO.read(:line)
    IO.read(:all)
      |> String.split("\n", trim: true)
      |> Enum.map(&make_point/1)
      |> area()
      |> IO.puts()
  end
end
