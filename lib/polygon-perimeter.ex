defmodule HackerRank.PolygonPerimeter do
  defp d(a, b, i) do
    elem(a, i) - elem(b, i)
  end

  defp distance(a, b) do
    :math.sqrt(d(a, b, 0) * d(a, b, 0) + d(a, b, 1) * d(a, b, 1))
  end

  defp calc_perimeter([a, b | tail]) do
    dist = distance(a, b)
    case tail do
      [] -> dist
      _ -> dist + calc_perimeter([b | tail])
    end
  end

  def perimeter(points) do
    calc_perimeter(points ++ [hd(points)])
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
      |> perimeter()
      |> IO.puts()
  end
end
