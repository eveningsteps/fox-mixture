defmodule HackerRank.PasswordCrackerFP.Test do
  use ExUnit.Case

  test "1" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(because can do must we what),
      "wedowhatwemustbecausewecan"
    ) == ~w(we do what we must because we can)
  end

  test "2" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(hello planet),
      "helloworld"
    ) == nil
  end

  test "3" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(ab abcd cd),
      "abcd"
    ) == ~w(ab cd)
  end

  test "4" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(ozkxyhkcst xvglh hpdnb zfzahm),
      "zfzahm"
    ) == ~w(zfzahm)
  end

  test "5" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(gurwgrb maqz holpkhqx aowypvopu),
      "gurwgrb"
    ) == ~w(gurwgrb)
  end

  test "Здравствуйте дорогой Мартин Алексеич" do
    assert HackerRank.PasswordCrackerFP.solve(
      ~w(a aa aaa aaaa aaaaa aaaaaa aaaaaaa aaaaaaaa aaaaaaaaa aaaaaaaaaa),
      "aaaaaaaaaab"
    ) == nil
  end
end
