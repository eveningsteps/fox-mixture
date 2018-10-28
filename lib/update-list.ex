defmodule HackerRank.UpdateList do
  def main() do
    IO.read(:all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&abs/1)
    |> Enum.join("\n")
    |> IO.puts
  end
end
