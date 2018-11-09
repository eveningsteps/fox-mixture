defmodule HackerRank.DesignerPDFViewer do
  def solve(heights, word) when is_list(heights) do
    solve(
      Enum.zip(?a..?z, heights) |> Map.new(),
      String.to_charlist(word)
    )
  end

  def solve(heights, word) when is_map(heights) do
    max_height = word
      |> Enum.map(fn char -> heights[char] end)
      |> Enum.max()
    max_height * length(word)
  end

  def main() do
    heights = IO.read(:line)
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    word = IO.read(:line) |> String.trim()
    solve(heights, word) |> IO.puts()
  end
end
