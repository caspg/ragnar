defmodule RagnarCore.HelperTest do
  @moduledoc false

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
end
