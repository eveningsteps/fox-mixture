defmodule HackerRank.PrefixCompression do
  def common(s1, s2) when "" in [s1, s2] do
    0
  end

  def common(<<h1::utf8, t1::binary>>, <<h2::utf8, t2::binary>>) do
    case h1 == h2 do
      true -> 1 + common(t1, t2)
      false -> 0
    end
  end

  def pprint(s, chop) do
    cut = String.slice(s, chop)
    case cut do
      "" -> IO.puts(0)
      _ -> IO.puts("#{String.length(cut)} #{cut}")
    end
  end

  def main() do
    a = IO.read(:line) |> String.trim
    b = IO.read(:line) |> String.trim
    v = common(a, b)

    if v > 0 do
      pprint(a, 0..v - 1)
    else
      IO.puts(0)
    end
    pprint(a, v..-1)
    pprint(b, v..-1)
  end
end
