defmodule HackerRank.TreeManager.Test do
  use ExUnit.Case

  test "simple" do
    initial = HackerRank.TreeManager.initial_state()
    altered = initial
      |> HackerRank.TreeManager.change(1)
      |> HackerRank.TreeManager.change(10)
    assert length(altered) == 1
    assert hd(altered).node.value == 10

    many_children = Enum.reduce(
      1..10, initial,
      fn x, acc ->
        HackerRank.TreeManager.insert_child(acc, x)
      end)
    assert length(many_children) == 1
    assert map_size(hd(many_children).node.children) == 10

    new_state = initial
      |> HackerRank.TreeManager.insert_child(1)
      |> HackerRank.TreeManager.visit_child(1)
    many_children_2 = Enum.reduce(
      10..2, new_state,
      fn x, acc ->
        HackerRank.TreeManager.insert_left(acc, x)
      end)
    assert many_children_2 |> HackerRank.TreeManager.visit_parent() == many_children

    new_state = initial
      |> HackerRank.TreeManager.insert_child(10)
      |> HackerRank.TreeManager.visit_child(1)
    many_children_3 = Enum.reduce(
      1..9, new_state,
      fn x, acc ->
        HackerRank.TreeManager.insert_right(acc, x)
      end)
    assert many_children_3 |> HackerRank.TreeManager.visit_parent() == many_children

    visited_all = Enum.reduce(
      1..10, many_children,
      fn x, acc ->
        acc
          |> HackerRank.TreeManager.visit_child(x)
          |> HackerRank.TreeManager.visit_parent()
      end)
    assert visited_all == many_children

    assert visited_all
      |> HackerRank.TreeManager.visit_child(1)
      |> HackerRank.TreeManager.visit_left()
      |> HackerRank.TreeManager.visit_right()
      |> HackerRank.TreeManager.visit_parent() == visited_all
  end

  test "sample from HackerRank, which I shamelessly copied" do
    commands = [
      "change 1",
      "insert child 2",
      "visit child 1",
      "insert right 3",
      "visit right",
      "insert right 4",
      "delete",
      "visit child 2",
    ]

    final_state = Enum.reduce(
      commands,
      HackerRank.TreeManager.initial_state(),
      fn operation, state -> HackerRank.TreeManager.modify_state(state, operation) end
    )
    assert final_state == [
      %{index: 2, node: %{children: %{}, value: 4}},
      %{
        index: 1,
        node: %{
          children: %{
            1 => %{children: %{}, value: 2},
            2 => %{children: %{}, value: 4}
          },
          value: 1
        }
      }
    ]
  end
end
