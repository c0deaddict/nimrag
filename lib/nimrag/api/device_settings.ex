defmodule Nimrag.Api.DeviceSettings do
  use Nimrag.Api.Data

  defmodule SettingsDuringActivity do
    use Nimrag.Api.Data

    schematic_struct do
      field(:default_screen, any(), nullable: true)
      field(:phone_notification_privacy_mode, any(), nullable: true)
      field(:screens, any(), nullable: true)
      field(:smart_notifications_sound, String.t())
      field(:smart_notifications_status, String.t())
    end
  end

  defmodule AutoActivityDetect do
    use Nimrag.Api.Data

    schematic_struct do
      field(:auto_activity_detect_enabled, boolean())
      field(:auto_activity_start_enabled, boolean())
      field(:cycling_enabled, boolean())
      field(:driving_enabled, boolean())
      field(:elliptical_enabled, boolean())
      field(:running_enabled, boolean())
      field(:swimming_enabled, boolean())
      field(:walking_enabled, boolean())
    end
  end

  defmodule ActivityTracking do
    use Nimrag.Api.Data

    schematic_struct do
      field(:activity_tracking_enabled, boolean())
      field(:blood_efficiency_acclimation_enabled, boolean(), nullable: true)
      field(:blood_efficiency_sleep_tracking_enabled, boolean(), nullable: true)
      field(:high_hr_alert_enabled, boolean())
      field(:high_hr_alert_threshold, integer())
      field(:low_hr_alert_enabled, boolean())
      field(:low_hr_alert_threshold, integer())
      field(:low_spo2_alert_enabled, any(), nullable: true)
      field(:move_alert_enabled, boolean())
      field(:move_bar_enabled, boolean(), nullable: true)
      field(:pulse_ox_acclimation_enabled, boolean())
      field(:pulse_ox_sleep_tracking_enabled, boolean())
      field(:spo2_threshold, any(), nullable: true)
    end
  end

  alias __MODULE__.{SettingsDuringActivity, AutoActivityDetect, ActivityTracking}

  schematic_struct do
    field(:hiking_format, any(), nullable: true)
    field(:smart_notifications_sound, String.t(), schema: oneof(["VIBRATION"]))
    field(:cardio_format, any(), nullable: true)
    field(:supported_audio_prompt_dialects, any(), nullable: true)
    field(:supported_screen_modes, any(), nullable: true)
    field(:sound_vibration_enabled, boolean())

    field(:controls_menu_list, [map()],
      schema:
        list(
          map(%{
            {"id", :id} => str(),
            {"index", :index} => int(),
            {"required", :required} => nullable(bool())
          })
        )
    )

    field(:data_recording, any(), nullable: true)
    field(:supported_watch_face_colors, any(), nullable: true)
    field(:intensity_minutes_calc_method, String.t(), schema: oneof(["HR_ZONES"]))
    field(:xc_ski_format, any(), nullable: true)
    field(:audio_prompt_heart_rate_type, String.t(), schema: oneof(["HEART_RATE"]))
    field(:custom_measurement_date, any(), nullable: true)
    field(:audio_prompt_power_duration, any(), nullable: true)
    field(:other_format, any(), nullable: true)
    field(:moderate_intensity_minutes_hr_zone, integer())
    field(:custom_body_fat_percent, any(), nullable: true)
    field(:screen_mode, any(), nullable: true)
    field(:avatar, any(), nullable: true)
    field(:auto_sync_steps_before_sync, integer())
    field(:blue_tooth_enabled, any(), nullable: true)
    field(:smart_notifications_status, String.t(), schema: oneof(["SHOW_ALL"]))
    field(:cycling_format, any(), nullable: true)
    field(:backlight_mode, any(), nullable: true)
    field(:disable_last_enabled_screen, any(), nullable: true)
    field(:audio_prompt_power_enabled, any(), nullable: true)
    field(:is_vivohub_enabled, any(), nullable: true)
    field(:audio_prompt_power_type, any(), nullable: true)
    field(:live_event_sharing_end_timestamp, any(), nullable: true)
    field(:optical_heart_rate_enabled, boolean())
    field(:key_vibration_enabled, boolean())
    field(:ble_connection_alert_enabled, boolean())
    field(:dnd_enabled, boolean())
    field(:supported_backlight_timeouts, any(), nullable: true)
    field(:relax_reminders_enabled, any(), nullable: true)
    field(:live_event_sharing_msg_triggers, [String.t()])
    field(:connect_iq, map(), json: "connectIQ", schema: map(%{{"autoUpdate", :auto_update} => bool()}))
    field(:start_of_week, String.t(), schema: weekday())
    field(:during_activity, SettingsDuringActivity.t())
    field(:vivohub_enabled, any(), nullable: true)
    field(:live_track_enabled, boolean())
    field(:date_format, String.t(), schema: oneof(["date_day_month"]))
    field(:phone_notification_mode, any(), nullable: true)
    field(:screen_timeout, any(), nullable: true)
    field(:pace_speed_unit, any(), nullable: true)
    field(:custom_device_muscle_mass, any(), nullable: true)
    field(:audio_prompt_speed_pace_frequency, String.t(), schema: oneof(["LAP"]))
    field(:audio_prompt_speed_pace_type, String.t(), schema: oneof(["AVERAGE"]))
    field(:turn_prompt_enabled, any(), nullable: true)
    field(:distance_unit, any(), nullable: true)
    field(:multiple_alarm_enabled, boolean())
    field(:live_event_sharing_trigger_distance, any(), nullable: true)
    field(:custom_device_body_fat_percent, any(), nullable: true)
    field(:supported_watch_faces, any(), nullable: true)

    field(:supported_languages, [map()],
      schema:
        list(
          map(%{
            {"id", :id} => int(),
            {"name", :name} => str()
          })
        )
    )

    field(:live_event_sharing_enabled, boolean())
    field(:enabled_screens, any())
    field(:custom_muscle_mass, any(), nullable: true)
    field(:lactate_threshold_auto_detect_enabled, any(), nullable: true)
    field(:sound_in_app_only_enabled, boolean())
    field(:audio_prompt_dialect_type, String.t())
    field(:supported_color_themes, any(), nullable: true)
    field(:mounting_side, String.t(), schema: oneof(["LEFT", "RIGHT"]))
    field(:screen_lists, any(), nullable: true)
    field(:glonass_enabled, any(), nullable: true)
    field(:weight_only_mode_enabled, any(), nullable: true)
    field(:supported_backlight_settings, [String.t()])
    field(:db_driven_defaults, boolean())
    field(:auto_upload_enabled, boolean())
    field(:elevation_unit, any(), nullable: true)
    field(:custom_device_weight, any(), nullable: true)
    field(:audio_prompt_heart_rate_enabled, boolean())
    field(:measurement_units, String.t(), schema: oneof(["metric"]))
    field(:backlight_wrist_turn_enabled, any(), nullable: true)
    field(:auto_activity_detect, AutoActivityDetect.t())
    field(:goal_animation, String.t())
    field(:wi_fi_auto_upload_enabled, any(), nullable: true)
    field(:live_event_sharing_target_distance, any(), nullable: true)
    field(:audio_prompt_speed_pace_enabled, boolean())
    field(:backlight_setting, any(), nullable: true)
    field(:device_id, integer())
    field(:school_mode, any(), nullable: true)
    field(:watch_face_item_list, any(), nullable: true)
    field(:nickname, any(), nullable: true)
    field(:color_theme, any(), nullable: true)
    field(:screen_orientation, any(), nullable: true)
    field(:visible_screens, any(), nullable: true)
    field(:watch_face, any(), nullable: true)
    field(:smart_notification_timeout, any(), nullable: true)
    field(:audio_prompt_speed_pace_duration, any(), nullable: true)
    field(:all_units, String.t(), schema: oneof(["metric"]))
    field(:language, integer())
    field(:audio_prompt_power_frequency, any(), nullable: true)
    field(:backlight_keys_and_alerts_enabled, any(), nullable: true)
    field(:audio_prompt_lap_enabled, boolean())
    field(:gesture_mode, any(), nullable: true)
    field(:max_alarm, integer())
    field(:time_format, String.t(), schema: oneof(["time_twenty_four_hr"]))
    field(:band_orientation, any(), nullable: true)
    field(:display_orientation, any(), nullable: true)
    field(:backlight_timeout, any(), nullable: true)
    field(:custom_wheel_size, any(), nullable: true)
    field(:phone_notification_privacy_mode, any(), nullable: true)
    field(:temperature_unit, any(), nullable: true)
    field(:key_tones_enabled, boolean())
    field(:metrics_file_trueup_enabled, boolean())
    field(:auto_sync_minutes_before_sync, integer())
    field(:user_notice_tones_enabled, any(), nullable: true)
    field(:audio_prompt_activity_alerts_enabled, any(), nullable: true)
    field(:strength_format, any(), nullable: true)
    field(:multiple_supported_watch_face, any())
    field(:dive_alerts, any(), nullable: true)
    field(:alarms, [any()])
    field(:phone_vibration_enabled, any(), nullable: true)
    field(:live_event_sharing_msg_contents, [String.t()])
    field(:default_page, any(), nullable: true)
    field(:weight_unit, any(), nullable: true)
    field(:segment_prompt_enabled, any(), nullable: true)
    field(:audio_prompt_heart_rate_duration, any(), nullable: true)
    field(:keep_user_name_private, any(), nullable: true)
    field(:sleep, any(), nullable: true)
    field(:audio_prompt_heart_rate_frequency, String.t())
    field(:height_unit, any(), nullable: true)
    field(:alert_tones_enabled, boolean())
    field(:vigorous_intensity_minutes_hr_zone, integer())
    field(:custom_user_text, any(), nullable: true)
    field(:supported_alarm_modes, [String.t()])
    field(:running_format, any(), nullable: true)
    field(:auto_sync_frequency, any(), nullable: true)
    field(:activity_tracking, ActivityTracking.t())
    field(:live_event_sharing_trigger_time, any(), nullable: true)
  end
end
