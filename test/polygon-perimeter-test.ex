defmodule HackerRank.PolygonPerimeter.Test do
  use ExUnit.Case

  test "simple" do
    points = [
      {0, 0},
      {0, 1},
      {1, 1},
      {1, 0},
    ]
    assert HackerRank.PolygonPerimeter.perimeter(points) == 4
  end
end
