defmodule Nimrag.Api.ActivityList do
  use Nimrag.Api.Data
  alias Nimrag.Api.ActivityType

  defmodule SplitSummary do
    use Nimrag.Api.Data

    schematic_struct do
      field(:average_elevation_gain, float())
      field(:average_speed, float())
      field(:distance, float())
      field(:duration, float())
      field(:elevation_loss, float())
      field(:max_distance, integer())
      field(:max_elevation_gain, float())
      field(:max_speed, float())
      field(:no_of_splits, integer())
      field(:num_climb_sends, integer())
      field(:num_falls, integer())

      field(:split_type, String.t(),
        schema: oneof(["RWD_STAND", "RWD_RUN", "RWD_WALK", "INTERVAL_ACTIVE"])
      )

      field(:total_ascent, float())
    end
  end

  schematic_struct do
    field(:activity_id, integer())
    field(:activity_name, String.t())
    field(:activity_training_load, float())
    field(:activity_type, ActivityType.t())
    field(:aerobic_training_effect, float())
    field(:aerobic_training_effect_message, String.t())
    field(:anaerobic_training_effect, float())
    field(:anaerobic_training_effect_message, String.t())
    field(:atp_activity, boolean())
    field(:auto_calc_calories, boolean())
    field(:average_hr, float(), nullable: true, json: "averageHR")
    field(:average_running_cadence_in_steps_per_minute, float())
    field(:average_speed, float())
    field(:avg_grade_adjusted_speed, float(), nullable: true)
    field(:avg_power, float(), nullable: true)
    field(:avg_stride_length, float())
    field(:begin_timestamp, DateTime.t(), schema: timestamp_as_datetime())
    field(:bmr_calories, float())
    field(:calories, float())
    field(:deco_dive, boolean())
    field(:description, String.t(), nullable: true)
    field(:device_id, integer())
    field(:distance, float())
    field(:duration, float())
    field(:elapsed_duration, float())
    field(:elevation_corrected, boolean())
    field(:elevation_gain, float(), nullable: true)
    field(:elevation_loss, float(), nullable: true)
    field(:end_latitude, float(), nullable: true)
    field(:end_longitude, float(), nullable: true)

    field(:end_time_gmt, DateTime.t(),
      json: "endTimeGMT",
      schema: gmt_datetime_as_datetime(),
      nullable: true
    )

    field(:event_type, map(),
      schema:
        map(%{
          {"sortOrder", :sort_order} => int(),
          {"typeId", :type_id} => int(),
          {"typeKey", :type_key} => str()
        })
    )

    field(:fastest_split_1000, float(), json: "fastestSplit_1000", nullable: true)
    field(:fastest_split_1609, float(), json: "fastestSplit_1609", nullable: true)
    field(:favorite, boolean())
    field(:has_heat_map, boolean(), nullable: true)
    field(:has_images, boolean())
    field(:has_polyline, boolean())
    field(:has_splits, boolean())
    field(:has_video, boolean())
    field(:hr_time_in_zone_1, float(), json: "hrTimeInZone_1", nullable: true)
    field(:hr_time_in_zone_2, float(), json: "hrTimeInZone_2", nullable: true)
    field(:hr_time_in_zone_3, float(), json: "hrTimeInZone_3", nullable: true)
    field(:hr_time_in_zone_4, float(), json: "hrTimeInZone_4", nullable: true)
    field(:hr_time_in_zone_5, float(), json: "hrTimeInZone_5", nullable: true)
    field(:lap_count, integer())
    field(:location_name, String.t(), nullable: true)
    field(:manual_activity, boolean())
    field(:manufacturer, String.t())
    field(:max_double_cadence, float())
    field(:max_elevation, float())
    field(:max_hr, float(), nullable: true, json: "maxHR")
    field(:max_power, float(), nullable: true)
    field(:max_running_cadence_in_steps_per_minute, float())
    field(:max_speed, float())
    field(:max_vertical_speed, float())
    field(:min_activity_lap_duration, float())
    field(:min_elevation, float())
    field(:moderate_intensity_minutes, integer(), nullable: true)
    field(:moving_duration, float())
    field(:norm_power, float(), nullable: true)
    field(:owner_display_name, String.t())
    field(:owner_full_name, String.t())
    field(:owner_id, integer())
    field(:owner_profile_image_url_large, String.t())
    field(:owner_profile_image_url_medium, String.t())
    field(:owner_profile_image_url_small, String.t())
    field(:parent, boolean())
    field(:power_time_in_zone_1, float(), json: "powerTimeInZone_1", nullable: true)
    field(:power_time_in_zone_2, float(), json: "powerTimeInZone_2", nullable: true)
    field(:power_time_in_zone_3, float(), json: "powerTimeInZone_3", nullable: true)
    field(:power_time_in_zone_4, float(), json: "powerTimeInZone_4", nullable: true)
    field(:power_time_in_zone_5, float(), json: "powerTimeInZone_5", nullable: true)
    field(:pr, boolean())

    field(:privacy, map(),
      schema: map(%{{"typeId", :type_id} => int(), {"typeKey", :type_key} => str()})
    )

    field(:purposeful, boolean())
    field(:qualifying_dive, false, nullable: true)
    field(:split_summaries, [SplitSummary.t()])
    field(:sport_type_id, integer())
    field(:start_latitude, float(), nullable: true)
    field(:start_longitude, float(), nullable: true)
    field(:start_time_gmt, DateTime.t(), json: "startTimeGMT", schema: gmt_datetime_as_datetime())
    field(:start_time_local, NaiveDateTime.t(), schema: naive_datetime())
    field(:steps, integer(), nullable: true)
    field(:summarized_dive_info, any())
    field(:time_zone_id, integer())
    field(:training_effect_label, String.t())
    field(:user_pro, boolean())
    field(:user_roles, [String.t()])
    field(:v_o2_max_value, float())
    field(:vigorous_intensity_minutes, integer(), nullable: true)
    field(:water_estimated, float())
  end
end
