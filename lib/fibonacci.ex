defmodule HackerRank.Fibonacci.State do
  def start_link() do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: __MODULE__)
  end

  def fib(n) do
    case Agent.get(__MODULE__, &Map.fetch(&1, n)) do
      {:ok, val} -> val
      :error ->
        new_val = fib(n - 1) + fib(n - 2)
        Agent.update(__MODULE__, &Map.put(&1, n, new_val))
        new_val
    end
  end
end

defmodule HackerRank.Fibonacci do
  @divisor 1_00_000_000 + 7

  def fib(n) do
    HackerRank.Fibonacci.State.start_link()
    rem(HackerRank.Fibonacci.State.fib(n), @divisor)
  end

  def main() do
    _ = IO.read(:line)
    IO.read(:all)
      |> String.split("\n", trim: true)
      |> Enum.map(fn v -> v |> String.to_integer() |> fib() end)
      |> Enum.join("\n")
      |> IO.puts()
  end
end
