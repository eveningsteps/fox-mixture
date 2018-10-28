defmodule HackerRank.StringCompression do
  def compress([], prev, count) do
    case count do
      0 -> []
      1 -> [prev]
      _ -> [prev, Integer.to_string(count)]
    end
  end

  def compress([head | tail], prev, count) do
    case prev == head do
      true -> compress(tail, head, count + 1)
      false ->
        val = compress(tail, head, 1)
        unless prev == nil do
          case count do
            1 -> [prev] ++ val
            _ -> [prev, Integer.to_string(count)] ++ val
          end
        else
          val
        end
    end
  end

  def main() do
    IO.gets("")
    |> String.trim
    |> String.to_charlist
    |> compress(nil, 0)
    |> IO.puts
  end
end
