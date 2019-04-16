defmodule HackerRank.ValidBST do
  defmodule Tree do
    def make_tree(nodes), do: insert_many(nil, nodes)

    def insert_many(tree, []), do: tree
    def insert_many(tree, [head | tail]) do
      new_tree = insert(tree, head)
      insert_many(new_tree, tail)
    end

    def make_node(value, left \\ nil, right \\ nil) do
      %{:value => value, :left => left, :right => right}
    end

    def insert(nil, value), do: make_node(value)
    def insert(tree, value) do
      cond do
        value < tree.value -> Map.put(tree, :left, insert(tree.left, value))
        value > tree.value -> Map.put(tree, :right, insert(tree.right, value))
        true -> raise "All BST values must be unique"
      end
    end
  end

  def preorder(nil), do: []
  def preorder(tree) do
    [tree.value] ++ preorder(tree.left) ++ preorder(tree.right)
  end

  def solve(s) do
    possible_preorder = s
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    case preorder(Tree.make_tree(possible_preorder)) == possible_preorder do
      true -> "YES"
      false -> "NO"
    end
  end

  def main() do
    _ = IO.read(:line)
    IO.read(:all)
      |> String.split("\n", trim: true)
      |> Enum.drop_every(2)
      |> Enum.map(fn s -> s |> solve() |> IO.puts() end)
  end
end
