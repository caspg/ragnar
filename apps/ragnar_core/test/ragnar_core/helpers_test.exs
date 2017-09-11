defmodule RagnarCore.HelperTest do
  use ExUnit.Case

  alias RagnarCore.Helper

  def x_days_ago(x_days) do
    Timex.now |> Timex.shift(days: -1 * x_days)
  end

  test "not_older_than_x_days/2" do
    x_days = 3
    days_ago_2 = x_days_ago(2)
    days_ago_5 = x_days_ago(5)

    assert Helper.not_older_than_x_days?(x_days, days_ago_2) == true
    assert Helper.not_older_than_x_days?(x_days, days_ago_5) == false
  end

  test "not_older_than_x_days/3" do
    days_ago_10 = x_days_ago(10)
    x_days = 3

    days_ago_12 = x_days_ago(12)
    days_ago_15 = x_days_ago(15)

    assert Helper.not_older_than_x_days?(x_days, days_ago_12, days_ago_10) == true
    assert Helper.not_older_than_x_days?(x_days, days_ago_15, days_ago_10) == false
  end
end
