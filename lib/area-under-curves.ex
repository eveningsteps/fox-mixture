defmodule HackerRank.AreaUnderCurves do
  @step 0.001

  def f([], [], _), do: 0

  def f([a0 | a], [b0 | b], x) do
    a0 * :math.pow(x, b0) + f(a, b, x)
  end

  def area(_, _, l, r) when l >= r, do: 0
  def area(a, b, l, r) do
    d = max(0, min(@step, r - l))
    d * f(a, b, l + d) + area(a, b, l + d, r)
  end

  def volume(_, _, l, r) when l >= r, do: 0
  def volume(a, b, l, r) do
    d = max(0, min(@step, r - l))
    d * :math.pi() * :math.pow(f(a, b, l + d), 2) + volume(a, b, l + d, r)
  end

  def read_ints() do
    IO.read(:line)
      |> String.trim()
      |> String.split()
      |> Enum.map(&String.to_integer/1)
  end

  def main() do
    a = read_ints()
    b = read_ints()
    [l, r] = read_ints()

    area(a, b, l, r) |> IO.puts()
    volume(a, b, l, r) |> IO.puts()
  end
end
