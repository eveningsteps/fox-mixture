defmodule HackerRank.DicePath do
  defmodule Dice do
    @pip_sum 7

    def pip_sum(), do: @pip_sum

    defstruct top: 1, front: 2, left: 3

    def right(dice) do
      %Dice{
        top: dice.left,
        front: dice.front,
        left: @pip_sum - dice.top,
      }
    end

    def down(dice) do
      %Dice{
        top: @pip_sum - dice.front,
        front: dice.top,
        left: dice.left
      }
    end

    def up(dice), do: dice |> down() |> down()
    def left(dice), do: dice |> right() |> right()
  end

  def to_right(_) do
  end
  def to_down(_) do
  end

  def solve(1, 1), do: {%Dice{}, %Dice{}, %Dice{}.top}
  def solve(1, n), do: solve(1, n - 1) |> to_right()
  def solve(m, 1), do: solve(m - 1, 1) |> to_down()

  def solve(_, _) do
  end

  def max_sum(m, n), do: solve(m, n) |> elem(1)
end
