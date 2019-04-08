defmodule HackerRank.AreaUnderCurvesTest do
  use ExUnit.Case

  @difference 0.01

  def relative_difference(a, b) do
    abs((a - b) / max(a, b))
  end

  test "simple" do
    assert HackerRank.AreaUnderCurves.f([1, 2], [3, 4], 3) ==
      1 * :math.pow(3, 3) + 2 * :math.pow(3, 4)

    area = 2435300.3
    assert relative_difference(
      area,
      HackerRank.AreaUnderCurves.area(
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        1, 4
      )
    ) <= @difference

    volume = 26172951168940.8
    assert relative_difference(
      volume,
      HackerRank.AreaUnderCurves.volume(
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        1, 4
      )
    ) <= @difference
  end
end
