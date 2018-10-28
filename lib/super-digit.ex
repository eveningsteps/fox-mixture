defmodule HackerRank.SuperDigit do
  def super_digit(s) do
    if String.length(s) == 1 do
      String.to_integer(s)
    else
      String.split(s, "", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum
      |> Integer.to_string
      |> super_digit
    end
  end

  def main() do
    [a, b] = IO.gets("")
    |> String.trim
    |> String.split

    (String.to_integer(b) * super_digit(a))
    |> Integer.to_string
    |> super_digit
    |> IO.puts
  end
end
