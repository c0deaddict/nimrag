defmodule Nimrag.Api.SleepDaily do
  use Nimrag.Api.Data

  defmodule Sleep do
    use Nimrag.Api.Data

    schematic_struct do
      field(:average_respiration_value, float())
      field(:avg_sleep_stress, float())
      field(:awake_count, integer())
      field(:awake_sleep_seconds, integer())
      field(:calendar_date, Date.t())
      field(:deep_sleep_seconds, integer())
      field(:highest_respiration_value, float())
      field(:id, integer())
      field(:light_sleep_seconds, integer())
      field(:lowest_respiration_value, float())
      field(:nap_time_seconds, integer())
      field(:rem_sleep_seconds, integer())
      field(:retro, boolean())

      field(:sleep_end_local_at, NaiveDateTime.t(),
        nullable: true,
        json: "sleepEndTimestampLocal",
        schema: timestamp_as_naive_datetime()
      )

      field(:sleep_start_local_at, NaiveDateTime.t(),
        nullable: true,
        json: "sleepStartTimestampLocal",
        schema: timestamp_as_naive_datetime()
      )

      field(:sleep_time_seconds, integer())
      field(:unmeasurable_sleep_seconds, integer())
    end
  end

  defmodule SleepMovement do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: gmt_datetime_as_datetime())
      field(:end_at, DateTime.t(), json: "endGMT", schema: gmt_datetime_as_datetime())
      field(:activity_level, float())
    end
  end

  defmodule SleepStress do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: timestamp_as_naive_datetime())
      field(:value, integer())
    end
  end

  defmodule HRVData do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: timestamp_as_naive_datetime())
      field(:value, float())
    end
  end

  defmodule SleepBodyBattery do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: timestamp_as_naive_datetime())
      field(:value, integer())
    end
  end

  defmodule SleepHeartRate do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: timestamp_as_naive_datetime())
      field(:value, integer())
    end
  end

  defmodule SleepLevel do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startGMT", schema: gmt_datetime_as_datetime())
      field(:end_at, DateTime.t(), json: "endGMT", schema: gmt_datetime_as_datetime())
      field(:activity_level, float())
    end
  end

  defmodule WellnessEpochRespirationAverage do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(),
        json: "epochEndTimestampGmt",
        schema: timestamp_as_naive_datetime()
      )

      field(:respiration_average_value, float())
      field(:respiration_high_value, float(), nullable: true)
      field(:respiration_low_value, float(), nullable: true)
    end
  end

  defmodule WellnessEpochRespirationData do
    use Nimrag.Api.Data

    schematic_struct do
      field(:start_at, DateTime.t(), json: "startTimeGMT", schema: timestamp_as_naive_datetime())
      field(:respiration_value, float())
    end
  end

  schematic_struct do
    field(:avg_overnight_hrv, float(), nullable: true)
    field(:body_battery_change, nil | integer())
    field(:hrv_data, [HRVData.t()], nullable: true)
    field(:hrv_status, String.t(), nullable: true)
    field(:rem_sleep_data, boolean())
    field(:respiration_version, integer(), nullable: true)
    field(:resting_heart_rate, integer(), nullable: true)
    field(:restless_moments_count, integer())
    field(:skin_temp_data_exists, boolean())
    field(:sleep, Sleep.t(), nullable: true, json: "dailySleepDTO")
    field(:sleep_body_battery, [SleepBodyBattery.t()], default: [])
    field(:sleep_heart_rate, [SleepHeartRate.t()], default: [])
    field(:sleep_levels, [SleepLevel.t()], default: [])
    field(:sleep_movement, [SleepMovement.t()], default: [])
    # field(:sleep_restless_moments, [SleepRestlessMoment.t()])
    field(:sleep_stress, [SleepStress.t()], default: [])

    field(:wellness_epoch_respiration_averages, [WellnessEpochRespirationAverage.t()],
      json: "wellnessEpochRespirationAveragesList",
      default: []
    )

    field(:wellness_epoch_respiration_data, [WellnessEpochRespirationData.t()],
      default: [],
      json: "wellnessEpochRespirationDataDTOList"
    )
  end
end
