defmodule Nimrag.Api.UserSettings do
  use Nimrag.Api.Data

  defmodule HydrationContainer do
    use Nimrag.Api.Data

    schematic_struct do
      field(:name, String.t())
      field(:volume, integer())
      field(:unit, String.t())
    end
  end

  defmodule WeatherLocation do
    use Nimrag.Api.Data

    schematic_struct do
      field(:iso_country_code, String.t(), nullable: true)
      field(:latitude, float(), nullable: true)
      field(:longitude, float(), nullable: true)
      field(:location_name, String.t(), nullable: true)
      field(:postal_code, String.t(), nullable: true)
      field(:use_fixed_location, boolean(), nullable: true)
    end
  end

  defmodule UserData do
    use Nimrag.Api.Data

    schematic_struct do
      field(:activity_level, integer(), nullable: true)
      field(:available_training_days, [String.t()], schema: list(weekday()))
      field(:birth_date, Date.t())
      field(:dive_number, integer(), nullable: true)
      field(:external_bottom_time, float(), nullable: true)
      field(:first_day_of_week, any())
      field(:firstbeat_cycling_lt_timestamp, integer(), nullable: true)
      field(:firstbeat_max_stress_score, float(), nullable: true)
      field(:firstbeat_running_lt_timestamp, integer(), nullable: true)
      field(:ftp_auto_detected, boolean(), nullable: true)
      field(:gender, String.t())
      field(:golf_distance_unit, String.t(), nullable: true)
      field(:golf_elevation_unit, String.t(), nullable: true)
      field(:golf_speed_unit, String.t(), nullable: true)
      field(:handedness, String.t())
      field(:heart_rate_format, any())
      field(:height, float())
      field(:hydration_auto_goal_enabled, boolean())
      field(:hydration_containers, [HydrationContainer.t()])
      field(:hydration_measurement_unit, String.t())
      field(:intensity_minutes_calc_method, String.t())
      field(:lactate_threshold_heart_rate, float(), nullable: true)
      field(:lactate_threshold_speed, float(), nullable: true)
      field(:measurement_system, String.t())
      field(:moderate_intensity_minutes_hr_zone, integer())
      field(:power_format, any())
      field(:preferred_long_training_days, [String.t()], schema: list(weekday()))
      field(:threshold_heart_rate_auto_detected, boolean(), nullable: true)
      field(:time_format, String.t())
      field(:training_status_paused_date, String.t(), nullable: true)
      field(:vigorous_intensity_minutes_hr_zone, integer())
      field(:vo_2_max_cycling, float(), nullable: true)
      field(:vo_2_max_running, float(), nullable: true)
      field(:weather_location, WeatherLocation.t())
      field(:weight, float(), nullable: true)
    end
  end

  defmodule UserSleep do
    use Nimrag.Api.Data

    schematic_struct do
      field(:default_sleep_time, boolean())
      field(:default_wake_time, boolean())
      field(:sleep_time, integer())
      field(:wake_time, integer())
    end
  end

  defmodule UserSleepWindow do
    use Nimrag.Api.Data

    schematic_struct do
      field(:sleep_window_frequency, String.t(), schema: oneof([weekday(), "DAILY"]))
      field(:start_sleep_time_seconds_from_midnight, integer())
      field(:end_sleep_time_seconds_from_midnight, integer())
    end
  end

  schematic_struct do
    field(:id, integer())
    field(:user_data, UserData.t())
    field(:user_sleep, UserSleep.t())
    field(:user_sleep_windows, [UserSleepWindow.t()])
    field(:connect_date, String.t(), nullable: true)
    field(:source_type, String.t(), nullable: true)
  end
end
