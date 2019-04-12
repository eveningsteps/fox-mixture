defmodule HackerRank.DicePath.Test do
  use ExUnit.Case

  test "dice rotation" do
    alias HackerRank.DicePath.Dice, as: Dice

    initial = %Dice{}

    assert initial |> Dice.down() |> Dice.down() |> Dice.down() |> Dice.down() == initial
    assert initial |> Dice.right() |> Dice.right() |> Dice.right() |> Dice.right() == initial

    rotated = initial |> Dice.down()

    assert rotated.top == Dice.pip_sum() - initial.front
    assert rotated.front == initial.top
    assert rotated.left == initial.left

    rotated = initial |> Dice.right()

    assert rotated.top == initial.left
    assert rotated.left == Dice.pip_sum() - initial.top
    assert rotated.front == initial.front

    rotated = initial |> Dice.right() |> Dice.down()

    assert rotated.top == Dice.pip_sum() - initial.front
    assert rotated.left == Dice.pip_sum() - initial.top
    assert rotated.front == initial.left
  end

  @tag skip: "No functionality yet"
  test "simple" do
    assert HackerRank.DicePath.max_sum(2, 2) == 9
    assert HackerRank.DicePath.max_sum(1, 2) == 4
    assert HackerRank.DicePath.max_sum(2, 1) == 6
    assert HackerRank.DicePath.max_sum(3, 3) == 19
  end
end
