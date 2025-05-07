defmodule Nimrag.Api.StepsDaily do
  use Nimrag.Api.Data

  schematic_struct do
    field(:calendar_date, Date.t())
    field(:step_goal, integer(), default: 0)
    field(:total_distance, integer(), default: 0)
    field(:total_steps, integer(), default: 0)
  end
end
