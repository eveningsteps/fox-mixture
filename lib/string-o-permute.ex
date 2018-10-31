defmodule HackerRank.StringOPermute do
  def permute(list) when list == [] do
    []
  end

  def permute(list) when is_list(list) do
    [h1, h2 | tail] = list
    [h2, h1] ++ permute(tail)
  end

  def permute(list) when is_binary(list) do
    list |> String.to_charlist() |> permute()
  end

  def main() do
    n = IO.read(:line) |> String.trim() |> String.to_integer()
    for _ <- 0..n - 1 do
      IO.read(:line)
        |> String.trim()
        |> permute()
        |> IO.puts()
    end
  end
end
