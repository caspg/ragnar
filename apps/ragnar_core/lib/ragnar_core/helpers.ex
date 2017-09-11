defmodule RagnarCore.Helper do
  def not_older_than_x_days?(x_days, target_date, reference_day \\ Timex.today) do
    Timex.after?(target_date, x_days_from_date(x_days, reference_day))
  end

  defp x_days_from_date(x_days, reference_day) do
    reference_day |> Timex.shift(days: -1 * x_days)
  end
end
