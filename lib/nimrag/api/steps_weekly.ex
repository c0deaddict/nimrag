defmodule Nimrag.Api.StepsWeekly do
  use Nimrag.Api.Data

  schematic_struct do
    field(:calendar_date, Date.t())

    field(
      :values,
      %{
        total_steps: float(),
        average_steps: float(),
        average_distance: float(),
        total_distance: float(),
        wellness_data_days_count: integer()
      },
      schema:
        map(%{
          field(:total_steps) => float(),
          field(:average_steps) => float(),
          field(:average_distance) => float(),
          field(:total_distance) => float(),
          field(:wellness_data_days_count) => int()
        })
    )
  end
end
