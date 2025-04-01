defmodule Nimrag.Api.UserSummaryDaily do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          abnormal_heart_rate_alerts_count: nil | integer(),
          active_kilocalories: float(),
          active_seconds: integer(),
          average_stress_level: integer(),
          bmr_kilocalories: float(),
          calendar_date: String.t(),
          floors_ascended: float(),
          floors_descended: float(),
          highly_active_seconds: integer(),
          max_heart_rate: integer(),
          measurable_awake_duration: integer(),
          min_heart_rate: integer(),
          moderate_intensity_minutes: integer(),
          sedentary_seconds: integer(),
          sleeping_seconds: integer(),
          total_distance_meters: integer(),
          total_kilocalories: float(),
          total_steps: integer(),
          vigorous_intensity_minutes: integer()
        }

  defstruct ~w(
    abnormal_heart_rate_alerts_count
    active_kilocalories
    active_seconds
    average_stress_level
    bmr_kilocalories
    calendar_date
    floors_ascended
    floors_descended
    highly_active_seconds
    max_heart_rate
    measurable_awake_duration
    min_heart_rate
    moderate_intensity_minutes
    sedentary_seconds
    sleeping_seconds
    total_distance_meters
    total_kilocalories
    total_steps
    vigorous_intensity_minutes
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:abnormal_heart_rate_alerts_count) => nullable(int()),
      field(:active_kilocalories) => float(),
      field(:active_seconds) => int(),
      field(:average_stress_level) => int(),
      field(:bmr_kilocalories) => float(),
      field(:calendar_date) => date(),
      field(:floors_ascended) => float(),
      field(:floors_descended) => float(),
      field(:highly_active_seconds) => int(),
      field(:max_heart_rate) => int(),
      field(:measurable_awake_duration) => int(),
      field(:min_heart_rate) => int(),
      field(:moderate_intensity_minutes) => int(),
      field(:sedentary_seconds) => int(),
      field(:sleeping_seconds) => int(),
      field(:total_distance_meters) => int(),
      field(:total_kilocalories) => float(),
      field(:total_steps) => int()
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
