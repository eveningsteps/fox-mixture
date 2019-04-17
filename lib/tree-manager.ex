
defmodule HackerRank.TreeManager do
  @doc """
  Operate on trees of arbitrary arity in functional style with immutable state,
  avoiding any in-place modifications. This is possible with maintaining the tree's state
  in form of a stack, where every frame contains a reference to the node we are (or were) in,
  and also its number among the siblings. Since all Elixir data structures are immutable,
  modification is mostly done by partially copying the current state with some references changed.

  More on the topic: https://habr.com/ru/post/279623/
  """

  def initial_state(), do: [make_frame(1, make_node())]

  def make_node(value \\ 0, children \\ %{}) do
    %{
      :value => value,
      :children => children,
    }
  end

  def make_frame(index, node) do
    %{
      :index => index,
      :node => node,
    }
  end

  def change([current | stack], value) do
    [make_frame(current.index, make_node(value, current.node.children)) | stack]
  end

  def print([current | stack]) do
    IO.puts(current.node.value)
    [current | stack]
  end

  def visit_left([current | stack]) do
    left_index = current.index - 1
    [make_frame(left_index, hd(stack).node.children[left_index]) | stack]
  end

  def visit_right([current | stack]) do
    right_index = current.index + 1
    [make_frame(right_index, hd(stack).node.children[right_index]) | stack]
  end

  def visit_parent([_ | stack]) do
    stack
  end

  def visit_child([current | stack], n) do
    [make_frame(n, current.node.children[n]), current | stack]
  end

  defp shift(map, n, direction) do
    d = case direction do
      :left -> -1
      :right -> +1
    end
    map
      |> Enum.map(fn {k, v} ->
        case k < n do
          true -> {k, v}
          false -> {k + d, v}
        end
      end)
      |> Map.new()
  end

  defp insert_sibling([current | stack], direction, value) do
    index = current.index + case direction do
      :right -> 1
      :left -> 0
    end

    [previous_frame | rest] = stack
    replaced_frame = make_frame(
      previous_frame.index,
      make_node(
        previous_frame.node.value,
        Map.put(
          shift(previous_frame.node.children, index, :right),
          index, make_node(value)
        )
      )
    )
    case direction do
      :right -> [current, replaced_frame | rest]
      :left -> [make_frame(current.index + 1, current.node), replaced_frame | rest]
    end
  end

  def insert_left([current | stack], value) do
    insert_sibling([current | stack], :left, value)
  end

  def insert_right([current | stack], value) do
    insert_sibling([current | stack], :right, value)
  end

  def insert_child([current | stack], value) do
    new_index = map_size(current.node.children) + 1
    new_children = Map.put(current.node.children, new_index, make_node(value))
    [make_frame(current.index, make_node(current.node.value, new_children)) | stack]
  end

  def delete([current | stack]) do
    [previous_frame | rest] = stack
    new_children = shift(
      Map.delete(previous_frame.node.children, current.index),
      current.index,
      :left
    )
    [make_frame(previous_frame.index, make_node(previous_frame.node.value, new_children)) | rest]
  end

  @command_with_args ~r/^(?<command>.*) (?<argument>\d+)/

  def modify_state(state, op) do
    {function_name, args} = case Regex.named_captures(@command_with_args, op) do
      %{"command" => command, "argument" => argument} -> {command, [String.to_integer(argument)]}
      nil -> {op, []}
    end

    apply(
      HackerRank.TreeManager,
      function_name |> String.replace(" ", "_") |> String.to_atom(),
      [state] ++ args
    )
  end

  def main() do
    _ = IO.read(:line)
    IO.read(:all)
      |> String.split("\n", trim: true)
      |> Enum.reduce(
        initial_state(),
        fn operation, state -> modify_state(state, operation) end
      )
  end
end
