defmodule HackerRank.ValidBST.Test do
  use ExUnit.Case

  test "tree construction" do
    assert HackerRank.ValidBST.Tree.make_tree([]) == nil
    assert HackerRank.ValidBST.Tree.make_tree([1]) == %{
      :value => 1,
      :left => nil,
      :right => nil,
    }
    assert HackerRank.ValidBST.Tree.make_tree([1, 2, 3]) == %{
      :value => 1,
      :left => nil,
      :right => %{
        :value => 2,
        :left => nil,
        :right => %{
          :value => 3,
          :left => nil,
          :right => nil,
        },
      },
    }
    assert HackerRank.ValidBST.Tree.make_tree([3, 2, 1, 5, 4, 6]) == %{
      :value => 3,
      :left => %{
        :value => 2,
        :left => %{
          :value => 1,
          :left => nil,
          :right => nil,
        },
        :right => nil,
      },
      :right => %{
        :value => 5,
        :left => %{
          :value => 4,
          :left => nil,
          :right => nil,
        },
        :right => %{
          :value => 6,
          :left => nil,
          :right => nil,
        },
      },
    }
    assert_raise RuntimeError, fn -> HackerRank.ValidBST.Tree.make_tree([1, 1]) end
  end

  test "simple preorder check" do
    preorder = [3, 2, 1, 5, 4, 6]
    assert HackerRank.ValidBST.preorder(HackerRank.ValidBST.Tree.make_tree(preorder)) == preorder

    no_preorder = [3, 6, 2, 1]
    refute HackerRank.ValidBST.preorder(HackerRank.ValidBST.Tree.make_tree(no_preorder)) == no_preorder
  end
end
