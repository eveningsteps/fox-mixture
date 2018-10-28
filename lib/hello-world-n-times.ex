defmodule HackerRank.HelloWorldNTimes do
  def replicate_out(n) when n == 0 do
  end

  def replicate_out(n) do
    IO.puts("Hello World")
    out(n - 1)
  end

  def main() do
    IO.gets("")
    |> String.trim
    |> String.to_integer
    |> replicate_out
  end
end
