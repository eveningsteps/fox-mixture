defmodule HackerRank.ArrayOfNElements do
  def n_elements(v) do
    Stream.cycle([v]) |> Enum.take(v) |> IO.inspect(limit: :infinity, charlists: :as_lists)
  end

  def main() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> n_elements
  end
end
