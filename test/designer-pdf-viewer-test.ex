defmodule DesignerPDFViewerTest do
  use ExUnit.Case

  test "simple" do
    assert HackerRank.DesignerPDFViewer.solve(
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      "abc"
    ) == 9
    assert HackerRank.DesignerPDFViewer.solve(
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7],
      "zaba"
    ) == 28
  end
end
