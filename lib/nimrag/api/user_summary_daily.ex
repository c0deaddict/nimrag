defmodule Nimrag.Api.UserSummaryDaily do
  use Nimrag.Api.Data

  schematic_struct do
    field(:abnormal_heart_rate_alerts_count, integer(), nullable: true)
    field(:active_kilocalories, float())
    field(:active_seconds, integer())
    field(:activity_stress_duration, integer())
    field(:activity_stress_percentage, float())
    field(:average_monitoring_environment_altitude, float(), nullable: true)
    field(:average_spo2, integer(), nullable: true)
    field(:average_stress_level, integer())
    field(:avg_waking_respiration_value, float(), nullable: true)
    field(:bmr_kilocalories, float())
    field(:body_battery_charged_value, integer(), nullable: true)
    field(:body_battery_drained_value, integer(), nullable: true)
    field(:body_battery_during_sleep, integer(), nullable: true)
    field(:body_battery_dynamic_feedback_event, any(), nullable: true)
    field(:body_battery_highest_value, integer(), nullable: true)
    field(:body_battery_lowest_value, integer(), nullable: true)
    field(:body_battery_most_recent_value, integer(), nullable: true)
    field(:body_battery_version, float(), nullable: true)
    field(:burned_kilocalories, float(), nullable: true)
    field(:calendar_date, Date.t())
    field(:consumed_kilocalories, float(), nullable: true)
    field(:daily_step_goal, integer())
    field(:duration_in_milliseconds, integer())
    field(:floors_ascended, float())
    field(:floors_ascended_in_meters, float())
    field(:floors_descended, float())
    field(:floors_descended_in_meters, float())
    field(:high_stress_duration, integer(), nullable: true)
    field(:high_stress_percentage, float())
    field(:highest_respiration_value, float(), nullable: true)
    field(:highly_active_seconds, integer())
    field(:includes_activity_data, boolean())
    field(:includes_calorie_consumed_data, boolean())
    field(:includes_wellness_data, boolean())
    field(:intensity_minutes_goal, integer())
    field(:last_seven_days_avg_resting_heart_rate, integer())

    field(:last_sync_timestamp_gmt, DateTime.t(),
      nullable: true,
      json: "lastSyncTimestampGMT",
      schema: gmt_datetime_as_datetime()
    )

    field(:latest_respiration_time_gmt, DateTime.t(),
      nullable: true,
      json: "latestRespirationTimeGMT",
      schema: gmt_datetime_as_datetime()
    )

    field(:latest_respiration_value, float(), nullable: true)
    field(:latest_spo2, float(), nullable: true)

    field(:latest_spo2_reading_time_gmt, DateTime.t(),
      nullable: true,
      schema: gmt_datetime_as_datetime()
    )

    field(:latest_spo2_reading_time_local, NaiveDateTime.t(),
      nullable: true,
      schema: naive_datetime()
    )

    field(:low_stress_duration, integer())
    field(:low_stress_percentage, float())
    field(:lowest_respiration_value, float(), nullable: true)
    field(:lowest_spo2, float(), nullable: true)
    field(:max_avg_heart_rate, integer())
    field(:max_heart_rate, integer())
    field(:max_stress_level, integer())
    field(:measurable_asleep_duration, integer())
    field(:measurable_awake_duration, integer())
    field(:medium_stress_duration, integer())
    field(:medium_stress_percentage, float())
    field(:min_avg_heart_rate, integer())
    field(:min_heart_rate, integer())
    field(:moderate_intensity_minutes, integer())
    field(:net_calorie_goal, float(), nullable: true)
    field(:net_remaining_kilocalories, float())
    field(:privacy_protected, boolean())
    field(:remaining_kilocalories, float(), nullable: true)
    field(:rest_stress_duration, integer())
    field(:rest_stress_percentage, float())
    field(:resting_calories_from_activity, float(), nullable: true)
    field(:resting_heart_rate, integer())
    field(:rule, any())
    field(:sedentary_seconds, integer())
    field(:sleeping_seconds, integer())
    field(:source, String.t())
    field(:stress_duration, integer())
    field(:stress_percentage, float())
    field(:stress_qualifier, String.t())
    field(:total_distance_meters, integer())
    field(:total_kilocalories, float())
    field(:total_steps, integer())
    field(:total_stress_duration, integer())
    field(:uncategorized_stress_duration, integer())
    field(:uncategorized_stress_percentage, float())
    field(:user_daily_summary_id, integer())
    field(:user_floors_ascended_goal, integer())
    field(:user_profile_id, integer())
    field(:uuid, String.t())
    field(:vigorous_intensity_minutes, integer())
    field(:wellness_active_kilocalories, float())
    field(:wellness_description, String.t(), nullable: true)
    field(:wellness_distance_meters, integer())
    field(:wellness_end_time_gmt, DateTime.t(), schema: gmt_datetime_as_datetime())
    field(:wellness_end_time_local, NaiveDateTime.t(), schema: naive_datetime())
    field(:wellness_kilocalories, float())
    field(:wellness_start_time_gmt, DateTime.t(), schema: gmt_datetime_as_datetime())
    field(:wellness_start_time_local, NaiveDateTime.t(), schema: naive_datetime())
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
