defmodule RotateStringTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "simple" do
    assert HackerRank.RotateString.rotate("abc") == "bca cab abc"
    assert HackerRank.RotateString.rotate("a") == "a"
  end
end
