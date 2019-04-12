defmodule HackerRank.PolygonArea.Test do
  use ExUnit.Case

  test "simple" do
    points = [
      {0, 0},
      {0, 1},
      {1, 1},
      {1, 0},
    ]
    assert HackerRank.PolygonArea.area(points) == 1
  end
end
