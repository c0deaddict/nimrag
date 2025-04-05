defmodule Nimrag.Api.UserSummaryDaily do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          abnormal_heart_rate_alerts_count: nil | integer(),
          active_kilocalories: float(),
          active_seconds: integer(),
          activity_stress_duration: integer(),
          activity_stress_percentage: float(),
          average_monitoring_environment_altitude: nil | float(),
          average_spo2: nil | integer(),
          average_stress_level: integer(),
          avg_waking_respiration_value: nil | float(),
          bmr_kilocalories: float(),
          body_battery_charged_value: nil | integer(),
          body_battery_drained_value: nil | integer(),
          body_battery_during_sleep: nil | integer(),
          # TODO type
          body_battery_dynamic_feedback_event: any(),
          body_battery_highest_value: nil | integer(),
          body_battery_lowest_value: nil | integer(),
          body_battery_most_recent_value: nil | integer(),
          body_battery_version: nil | float(),
          burned_kilocalories: nil | float(),
          calendar_date: String.t(),
          consumed_kilocalories: nil | float(),
          daily_step_goal: integer(),
          duration_in_milliseconds: integer(),
          floors_ascended: float(),
          floors_ascended_in_meters: float(),
          floors_descended: float(),
          floors_descended_in_meters: float(),
          high_stress_duration: nil | integer(),
          high_stress_percentage: float(),
          highest_respiration_value: nil | float(),
          highly_active_seconds: integer(),
          includes_activity_data: bool(),
          includes_calorie_consumed_data: bool(),
          includes_wellness_data: bool(),
          intensity_minutes_goal: integer(),
          last_seven_days_avg_resting_heart_rate: integer(),
          last_sync_timestamp_gmt: nil | String.t(),
          latest_respiration_time_gmt: nil | String.t(),
          latest_respiration_value: nil | float(),
          latest_spo2: nil | float(),
          latest_spo2_reading_time_gmt: nil | float(),
          latest_spo2_reading_time_local: nil | float(),
          low_stress_duration: integer(),
          low_stress_percentage: float(),
          lowest_respiration_value: nil | float(),
          lowest_spo2: nil | float(),
          max_avg_heart_rate: integer(),
          max_heart_rate: integer(),
          max_stress_level: integer(),
          measurable_asleep_duration: integer(),
          measurable_awake_duration: integer(),
          medium_stress_duration: integer(),
          medium_stress_percentage: float(),
          min_avg_heart_rate: integer(),
          min_heart_rate: integer(),
          moderate_intensity_minutes: integer(),
          net_calorie_goal: nil | float(),
          net_remaining_kilocalories: float(),
          privacy_protected: bool(),
          remaining_kilocalories: nil | float(),
          rest_stress_duration: integer(),
          rest_stress_percentage: float(),
          resting_calories_from_activity: nil | float(),
          resting_heart_rate: integer(),
          # TODO type
          rule: any(),
          sedentary_seconds: integer(),
          sleeping_seconds: integer(),
          source: String.t(),
          stress_duration: integer(),
          stress_percentage: float(),
          stress_qualifier: String.t(),
          total_distance_meters: integer(),
          total_kilocalories: float(),
          total_steps: integer(),
          total_stress_duration: integer(),
          uncategorized_stress_duration: integer(),
          uncategorized_stress_percentage: float(),
          user_daily_summary_id: integer(),
          user_floors_ascended_goal: integer(),
          user_profile_id: integer(),
          uuid: String.t(),
          vigorous_intensity_minutes: integer(),
          wellness_active_kilocalories: float(),
          wellness_description: nil | String.t(),
          wellness_distance_meters: integer(),
          wellness_end_time_gmt: String.t(),
          wellness_end_time_local: String.t(),
          wellness_kilocalories: float(),
          wellness_start_time_gmt: String.t(),
          wellness_start_time_local: String.t()
        }

  defstruct ~w(
    abnormal_heart_rate_alerts_count
    active_kilocalories
    active_seconds
    activity_stress_duration
    activity_stress_percentage
    average_monitoring_environment_altitude
    average_spo2
    average_stress_level
    avg_waking_respiration_value
    bmr_kilocalories
    body_battery_charged_value
    body_battery_drained_value
    body_battery_during_sleep
    body_battery_dynamic_feedback_event
    body_battery_highest_value
    body_battery_lowest_value
    body_battery_most_recent_value
    body_battery_version
    burned_kilocalories
    calendar_date
    consumed_kilocalories
    daily_step_goal
    duration_in_milliseconds
    floors_ascended
    floors_ascended_in_meters
    floors_descended
    floors_descended_in_meters
    high_stress_duration
    high_stress_percentage
    highest_respiration_value
    highly_active_seconds
    includes_activity_data
    includes_calorie_consumed_data
    includes_wellness_data
    intensity_minutes_goal
    last_seven_days_avg_resting_heart_rate
    last_sync_timestamp_gmt
    latest_respiration_time_gmt
    latest_respiration_value
    latest_spo2
    latest_spo2_reading_time_gmt
    latest_spo2_reading_time_local
    low_stress_duration
    low_stress_percentage
    lowest_respiration_value
    lowest_spo2
    max_avg_heart_rate
    max_heart_rate
    max_stress_level
    measurable_asleep_duration
    measurable_awake_duration
    medium_stress_duration
    medium_stress_percentage
    min_avg_heart_rate
    min_heart_rate
    moderate_intensity_minutes
    net_calorie_goal
    net_remaining_kilocalories
    privacy_protected
    remaining_kilocalories
    rest_stress_duration
    rest_stress_percentage
    resting_calories_from_activity
    resting_heart_rate
    rule
    sedentary_seconds
    sleeping_seconds
    source
    stress_duration
    stress_percentage
    stress_qualifier
    total_distance_meters
    total_kilocalories
    total_steps
    total_stress_duration
    uncategorized_stress_duration
    uncategorized_stress_percentage
    user_daily_summary_id
    user_floors_ascended_goal
    user_profile_id
    uuid
    vigorous_intensity_minutes
    wellness_active_kilocalories
    wellness_description
    wellness_distance_meters
    wellness_end_time_gmt
    wellness_end_time_local
    wellness_kilocalories
    wellness_start_time_gmt
    wellness_start_time_local
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:abnormal_heart_rate_alerts_count) => nullable(int()),
      field(:active_kilocalories) => float(),
      field(:active_seconds) => int(),
      field(:activity_stress_duration) => int(),
      field(:activity_stress_percentage) => float(),
      field(:average_monitoring_environment_altitude) => nullable(float()),
      field(:average_spo2) => nullable(int()),
      field(:average_stress_level) => int(),
      field(:avg_waking_respiration_value) => nullable(float()),
      field(:bmr_kilocalories) => float(),
      field(:body_battery_charged_value) => nullable(int()),
      field(:body_battery_drained_value) => nullable(int()),
      field(:body_battery_during_sleep) => nullable(int()),
      field(:body_battery_dynamic_feedback_event) => any(),
      field(:body_battery_highest_value) => nullable(int()),
      field(:body_battery_lowest_value) => nullable(int()),
      field(:body_battery_most_recent_value) => nullable(int()),
      field(:body_battery_version) => nullable(float()),
      field(:burned_kilocalories) => nullable(float()),
      field(:calendar_date) => date(),
      field(:consumed_kilocalories) => nullable(float()),
      field(:daily_step_goal) => int(),
      field(:duration_in_milliseconds) => int(),
      field(:floors_ascended) => float(),
      field(:floors_ascended_in_meters) => float(),
      field(:floors_descended) => float(),
      field(:floors_descended_in_meters) => float(),
      field(:high_stress_duration) => nullable(int()),
      field(:high_stress_percentage) => float(),
      field(:highest_respiration_value) => nullable(float()),
      field(:highly_active_seconds) => int(),
      field(:includes_activity_data) => bool(),
      field(:includes_calorie_consumed_data) => bool(),
      field(:includes_wellness_data) => bool(),
      field(:intensity_minutes_goal) => int(),
      field(:last_seven_days_avg_resting_heart_rate) => int(),
      {"lastSyncTimestampGMT", :last_sync_timestamp_gmt} => nullable(gmt_datetime_as_datetime()),
      {"latestRespirationTimeGMT", :latest_respiration_time_gmt} =>
        nullable(gmt_datetime_as_datetime()),
      field(:latest_respiration_value) => nullable(float()),
      field(:latest_spo2) => nullable(float()),
      {"latestSpo2ReadingTimeGMT", :latest_spo2_reading_time_gmt} => nullable(float()),
      field(:latest_spo2_reading_time_local) => nullable(float()),
      field(:low_stress_duration) => int(),
      field(:low_stress_percentage) => float(),
      field(:lowest_respiration_value) => nullable(float()),
      field(:lowest_spo2) => nullable(float()),
      field(:max_avg_heart_rate) => int(),
      field(:max_heart_rate) => int(),
      field(:max_stress_level) => int(),
      field(:measurable_asleep_duration) => int(),
      field(:measurable_awake_duration) => int(),
      field(:medium_stress_duration) => int(),
      field(:medium_stress_percentage) => float(),
      field(:min_avg_heart_rate) => int(),
      field(:min_heart_rate) => int(),
      field(:moderate_intensity_minutes) => int(),
      field(:net_calorie_goal) => nullable(float()),
      field(:net_remaining_kilocalories) => float(),
      field(:privacy_protected) => bool(),
      field(:remaining_kilocalories) => nullable(float()),
      field(:rest_stress_duration) => int(),
      field(:rest_stress_percentage) => float(),
      field(:resting_calories_from_activity) => nullable(float()),
      field(:resting_heart_rate) => int(),
      field(:rule) => any(),
      field(:sedentary_seconds) => int(),
      field(:sleeping_seconds) => int(),
      field(:source) => str(),
      field(:stress_duration) => int(),
      field(:stress_percentage) => float(),
      field(:stress_qualifier) => str(),
      field(:total_distance_meters) => int(),
      field(:total_kilocalories) => float(),
      field(:total_steps) => int(),
      field(:total_stress_duration) => int(),
      field(:uncategorized_stress_duration) => int(),
      field(:uncategorized_stress_percentage) => float(),
      field(:user_daily_summary_id) => int(),
      field(:user_floors_ascended_goal) => int(),
      field(:user_profile_id) => int(),
      field(:uuid) => str(),
      field(:vigorous_intensity_minutes) => int(),
      field(:wellness_active_kilocalories) => float(),
      field(:wellness_description) => nullable(str()),
      field(:wellness_distance_meters) => int(),
      field(:wellness_end_time_gmt) => gmt_datetime_as_datetime(),
      field(:wellness_end_time_local) => naive_datetime(),
      field(:wellness_kilocalories) => float(),
      field(:wellness_start_time_gmt) => gmt_datetime_as_datetime(),
      field(:wellness_start_time_local) => naive_datetime()
    })
  end
end

# %{
#   "uncategorizedStressDuration" => 120,
#   "measurableAwakeDuration" => 600,
#   "averageMonitoringEnvironmentAltitude" => 159.0,
#   "stressDuration" => 4200,
#   "bodyBatteryDuringSleep" => 46,
#   "activityStressPercentage" => 1.48,
#   "wellnessDistanceMeters" => 161,
#   "bodyBatteryVersion" => 3.0,
#   "floorsDescended" => 0.0,
#   "latestSpo2" => nil,
#   "wellnessStartTimeGmt" => "2024-04-05T22:00:00.0",
#   "wellnessEndTimeGmt" => "2024-04-06T04:51:00.0",
#   "wellnessEndTimeLocal" => "2024-04-06T06:51:00.0",
#   "measurableAsleepDuration" => 23580,
#   "wellnessStartTimeLocal" => "2024-04-06T00:00:00.0",
#   "minAvgHeartRate" => 53,
#   "wellnessActiveKilocalories" => 4.0,
#   "activityStressDuration" => 360,
#   "userDailySummaryId" => 3532005,
#   "totalSteps" => 203,
#   "averageStressLevel" => 22,
#   "floorsAscendedInMeters" => 0.0,
#   "userFloorsAscendedGoal" => 0,
#   "netRemainingKilocalories" => 1804.0,
#   "sedentarySeconds" => 616,
#   "includesActivityData" => false,
#   "netCalorieGoal" => 1800,
#   "includesWellnessData" => true,
#   "averageSpo2" => nil,
#   "bmrKilocalories" => 594.0,
#   "consumedKilocalories" => nil,
#   "lowestRespirationValue" => 13.0,
#   "lastSyncTimestampGMT" => "2024-04-06T04:51:55.607",
#   "vigorousIntensityMinutes" => 0,
#   "source" => "GARMIN",
#   "uncategorizedStressPercentage" => 0.49,
#   "bodyBatteryMostRecentValue" => 69,
#   "highStressDuration" => nil,
#   "rule" => %{"typeId" => 3, "typeKey" => "subscribers"},
#   "userProfileId" => 3532005,
#   "totalDistanceMeters" => 161,
#   "wellnessDescription" => nil,
#   "bodyBatteryDynamicFeedbackEvent" => %{
#     "bodyBatteryLevel" => "MODERATE",
#     "eventTimestampGmt" => "2024-04-06T02:32:33",
#     "feedbackLongType" => "EARLY_MORNING_NO_DATA",
#     "feedbackShortType" => nil
#   },
#   "avgWakingRespirationValue" => 14.0,
#   "maxStressLevel" => 62,
#   "stressQualifier" => "UNKNOWN",
#   "highestRespirationValue" => 19.0,
#   "latestRespirationTimeGMT" => "2024-04-06T04:51:00.0",
#   "lowStressPercentage" => 17.04,
#   "wellnessKilocalories" => 598.0,
#   "lastSevenDaysAvgRestingHeartRate" => 52,
#   "uuid" => "d4b3a74c4ab94ebba80c556a9a5eff21",
#   "intensityMinutesGoal" => 180,
#   "bodyBatteryHighestValue" => 69,
#   "restingCaloriesFromActivity" => nil,
#   "dailyStepGoal" => 7777,
#   "remainingKilocalories" => 598.0,
#   "bodyBatteryChargedValue" => 40,
#   "includesCalorieConsumedData" => false,
#   "lowestSpo2" => nil,
#   "lowStressDuration" => 4140,
#   "activeSeconds" => 37,
#   "activeKilocalories" => 4.0,
#   "latestSpo2ReadingTimeLocal" => nil,
#   "minHeartRate" => 52,
#   "restingHeartRate" => 55,
#   "abnormalHeartRateAlertsCount" => nil,
#   "mediumStressDuration" => 60,
#   "bodyBatteryDrainedValue" => 0,
#   "durationInMilliseconds" => 24660000,
#   "latestRespirationValue" => 14.0,
#   "maxAvgHeartRate" => 88,
#   "calendarDate" => "2024-04-06",
#   "highlyActiveSeconds" => 44,
#   "privacyProtected" => false,
#   "mediumStressPercentage" => 0.25,
#   "totalStressDuration" => 24300,
#   "floorsDescendedInMeters" => 0.0,
#   "highStressPercentage" => 0.0,
#   "moderateIntensityMinutes" => 0,
#   "maxHeartRate" => 88,
#   "sleepingSeconds" => 23963,
#   "latestSpo2ReadingTimeGmt" => nil,
#   "burnedKilocalories" => nil,
#   "floorsAscended" => 0.0,
#   "stressPercentage" => 17.28,
#   "restStressPercentage" => 80.74,
#   "totalKilocalories" => 598.0,
#   "bodyBatteryLowestValue" => 29,
#   "restStressDuration" => 19620
# }
