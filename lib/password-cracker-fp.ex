defmodule HackerRank.PasswordCrackerFP do
  def solve(_, [], _), do: nil
  def solve(_, _, ""), do: []

  def solve(passwords, [head | tail], attempt) do
    case String.starts_with?(attempt, head) do
      false -> solve(passwords, tail, attempt)
      true ->
        {_, uncracked} = String.split_at(attempt, String.length(head))
        case solve(passwords, passwords, uncracked) do
          nil -> nil
          v -> [head | v]
        end
    end
  end

  def solve(passwords, attempt) do
    solve(passwords, passwords, attempt)
  end

  def read_and_solve(0), do: []
  def read_and_solve(cases) do
    {_, passwords, attempt} = {IO.read(:line), IO.read(:line), IO.read(:line)}
    [
      solve(
        passwords |> String.trim() |> String.split(" ", trim: true),
        attempt |> String.trim()
      ) | read_and_solve(cases - 1)
    ]
  end

  def main() do
    cases = IO.read(:line) |> String.trim() |> String.to_integer()
    read_and_solve(cases)
      |> Enum.map(fn result ->
        case result do
          nil -> "WRONG PASSWORD"
          v -> v |> Enum.join(" ")
        end
      end)
      |> Enum.join("\n")
      |> IO.puts()
  end
end
