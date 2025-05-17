defmodule Nimrag.Api.TrainingReadiness do
  use Nimrag.Api.Data

  schematic_struct do
    field(:acute_load, integer())
    field(:acwr_factor_feedback, String.t(), schema: quality())
    field(:acwr_factor_percent, integer())
    field(:calendar_date, Date.t())
    field(:device_id, integer())
    field(:feedback_long, String.t())
    field(:feedback_short, String.t())
    field(:hrv_factor_feedback, String.t(), schema: quality())
    field(:hrv_factor_percent, integer())
    field(:hrv_weekly_average, integer())
    field(:input_context, any(), nullable: true)
    field(:level, String.t(), schema: oneof(["LOW", "MODERATE", "HIGH"]))
    field(:primary_activity_tracker, boolean())
    field(:recovery_time, integer())
    field(:recovery_time_change_phrase, String.t())
    field(:recovery_time_factor_feedback, String.t(), schema: quality())
    field(:recovery_time_factor_percent, integer())
    field(:score, integer())
    field(:sleep_history_factor_feedback, String.t(), schema: quality())
    field(:sleep_history_factor_percent, integer())
    field(:sleep_score, integer())
    field(:sleep_score_factor_feedback, String.t(), schema: quality())
    field(:sleep_score_factor_percent, integer())
    field(:stress_history_factor_feedback, String.t(), schema: quality())
    field(:stress_history_factor_percent, integer())
    field(:timestamp, DateTime.t(), schema: gmt_datetime_as_datetime())
    field(:timestamp_local, NaiveDateTime.t(), schema: naive_datetime())
    field(:user_profile_pk, integer(), json: "userProfilePK")
    field(:valid_sleep, boolean())
  end

  def quality(), do: oneof(["POOR", "MODERATE", "GOOD", "VERY_GOOD"])
end
