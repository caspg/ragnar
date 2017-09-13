defmodule RagnarCore.Helper do
  @moduledoc false

  alias RagnarCore.TimexHelper

  def not_older_than_x_days?(x_days, target_date) do
    Timex.after?(target_date, x_days_from_date(x_days))
  end

  defp x_days_from_date(x_days) do
    TimexHelper.today |> Timex.shift(days: -1 * x_days)
  end
end

defmodule RagnarCore.TimexHelper do
  @moduledoc """
  This module allows to mock Timex.today during tests
  without mocking the whole Timex module.
  """

  def today do
    Timex.today
  end
end
