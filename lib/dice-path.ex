defmodule HackerRank.DicePath do
  defmodule Dice do
    @pip_sum 7

    def pip_sum(), do: @pip_sum

    defstruct top: 1, front: 2, left: 3

    def to_right(dice) do
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
  end

  defmodule State do
    def start_link() do
      Agent.start_link(
        fn ->
          %{{1, 1} => MapSet.new([{%Dice{}, %Dice{}.top}])}
        end,
        name: __MODULE__
      )
    end

    def solve(m, n) do
      case Agent.get(__MODULE__, &Map.fetch(&1, {m, n})) do
        {:ok, val} -> val
        :error ->
          new_val = case {m, n} do
            {1, _} -> solve(1, n - 1) |> HackerRank.DicePath.to_right()
            {_, 1} -> solve(m - 1, 1) |> HackerRank.DicePath.down()
            _ -> MapSet.union(
              solve(m, n - 1) |> HackerRank.DicePath.to_right(),
              solve(m - 1, n) |> HackerRank.DicePath.down()
            )
          end
          Agent.update(__MODULE__, &Map.put(&1, {m, n}, new_val))
          new_val
      end
    end
  end

  def to_right(mapset) when is_map(mapset) do
      mapset |> Enum.map(&to_right/1) |> MapSet.new()
  end

  def to_right({dice, score}) do
    new_dice = dice |> Dice.to_right()
    {new_dice, score + new_dice.top}
  end

  def down(mapset) when is_map(mapset) do
    mapset |> Enum.map(&down/1) |> MapSet.new()
  end

  def down({dice, score}) do
    new_dice = dice |> Dice.down()
    {new_dice, score + new_dice.top}
  end

  def solve(m, n) do
    HackerRank.DicePath.State.solve(m, n)
      |> Enum.map(&elem(&1, 1)) |> Enum.max()
  end

  def init() do
    HackerRank.DicePath.State.start_link()
  end

  def main() do
    init()
    _ = IO.read(:line)
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(
      fn line ->
        processed = line |> String.split(" ") |> Enum.map(&String.to_integer/1)
        apply(&solve/2, processed)
      end
    )
    |> Enum.join("\n")
    |> IO.puts()
  end
end
