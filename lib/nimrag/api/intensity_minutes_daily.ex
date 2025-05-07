defmodule Nimrag.Api.IntensityMinutesDaily do
  use Nimrag.Api.Data

  schematic_struct do
    field(:calendar_date, Date.t())
    field(:day_of_goal_met, String.t(), nullable: true)
    field(:end_day_minutes, integer())
    field(:end_at, DateTime.t(), json: "endTimestampGMT", schema: gmt_datetime_as_datetime())
    field(:end_local_at, NaiveDateTime.t(), json: "endTimestampLocal", schema: naive_datetime())

    field(:im_value_descriptors_dto_list, map(),
      nullable: true,
      schema:
        map(%{
          "index" => int(),
          "key" => str()
        })
    )

    field(:im_values_array, list(list(integer())), nullable: true)
    field(:moderate_minutes, integer())
    field(:start_day_minutes, integer())
    field(:start_at, DateTime.t(), json: "startTimestampGMT", schema: gmt_datetime_as_datetime())
    field(:start_local, NaiveDateTime.t(), json: "startTimestampLocal", schema: naive_datetime())
    field(:user_profile_pk, integer(), json: "userProfilePK")
    field(:vigorous_minutes, integer())
    field(:week_goal, integer())
    field(:weekly_moderate, integer())
    field(:weekly_total, integer())
    field(:weekly_vigorous, integer())
  end
end
