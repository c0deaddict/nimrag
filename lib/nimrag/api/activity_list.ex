defmodule Nimrag.Api.ActivityList do
  use Nimrag.Api.Data
  alias Nimrag.Api.ActivityType

  schematic_struct do
    field(:activity_id, integer())
    field(:activity_name, String.t())
    field(:activity_type, ActivityType.t())
    field(:average_hr, float(), nullable: true, json: "averageHR")
    field(:begin_at, DateTime.t(), json: "beginTimestamp", schema: timestamp_as_datetime())
    field(:calories, float())
    field(:description, String.t(), nullable: true)
    field(:distance, float())
    field(:duration, float())
    field(:elevation_gain, float(), nullable: true)
    field(:elevation_loss, float(), nullable: true)
    field(:end_latitude, float(), nullable: true)
    field(:end_longitude, float(), nullable: true)
    field(:location_name, String.t(), nullable: true)
    field(:max_hr, float(), nullable: true, json: "maxHR")
    field(:start_latitude, float(), nullable: true)
    field(:start_local_at, NaiveDateTime.t(), json: "startTimeLocal", schema: naive_datetime())
    field(:start_longitude, float(), nullable: true)
    field(:steps, integer(), nullable: true)
  end
end
