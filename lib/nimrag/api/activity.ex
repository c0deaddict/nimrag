defmodule Nimrag.Api.Activity do
  use Nimrag.Api.Data
  alias Nimrag.Api.ActivityType

  defmodule Summary do
    use Nimrag.Api.Data

    schematic_struct do
      field(:distance, float())
      field(:duration, float())
      field(:average_hr, float(), nullable: true, json: "averageHR")
      field(:max_hr, float(), nullable: true, json: "maxHR")
      field(:elevation_gain, float(), nullable: true)
      field(:elevation_loss, float(), nullable: true)
      field(:start_local_at, NaiveDateTime.t(), json: "startTimeLocal", schema: naive_datetime())
      field(:start_at, DateTime.t(), json: "startTimeGMT", schema: gmt_datetime_as_datetime())
    end
  end

  schematic_struct do
    field(:activity_id, integer())
    field(:activity_name, String.t())
    field(:activity_type, ActivityType.t(), json: "activityTypeDTO")
    field(:description, String.t(), nullable: true)
    field(:summary, Summary.t(), json: "summaryDTO")
  end
end
