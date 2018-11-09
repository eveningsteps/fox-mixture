defmodule HackerRank.UtopianTree do
  def advance(n) do
    d = rem(n, 2) + 1
    round(:math.pow(2, div(n, 2) + d) - d)
  end

  def main() do
    _ = IO.read(:line)
    IO.read(:all)
      |> String.split()
      |> Enum.map(
        fn n -> n
          |> String.to_integer()
          |> advance()
          |> IO.puts()
        end
      )
  end
end
