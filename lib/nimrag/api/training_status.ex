defmodule Nimrag.Api.TrainingStatus do
  use Nimrag.Api.Data

  defmodule RecordedDevice do
    use Nimrag.Api.Data

    schematic_struct do
      field(:category, integer())
      field(:device_id, integer())
      field(:device_name, String.t())
      field(:image_url, String.t(), json: "imageURL")
    end
  end

  defmodule LoadBalance do
    use Nimrag.Api.Data

    defmodule Data do
      use Nimrag.Api.Data

      schematic_struct do
        field(:calendar_date, Date.t())
        field(:device_id, integer())
        field(:monthly_load_aerobic_high, float())
        field(:monthly_load_aerobic_high_target_max, integer())
        field(:monthly_load_aerobic_high_target_min, integer())
        field(:monthly_load_aerobic_low, float())
        field(:monthly_load_aerobic_low_target_max, integer())
        field(:monthly_load_aerobic_low_target_min, integer())
        field(:monthly_load_anaerobic, float())
        field(:monthly_load_anaerobic_target_max, integer())
        field(:monthly_load_anaerobic_target_min, integer())
        field(:primary_training_device, boolean())
        field(:training_balance_feedback_phrase, String.t())
      end
    end

    schematic_struct do
      field(:metrics_training_load_balance_dto_map, %{String.t() => Data.t()},
        json: "metricsTrainingLoadBalanceDTOMap"
      )

      field(:recorded_devices, [RecordedDevice.t()])
      field(:user_id, integer())
    end
  end

  defmodule Status do
    use Nimrag.Api.Data

    defmodule AcuteTrainingLoad do
      use Nimrag.Api.Data

      schematic_struct do
        field(:acwr_percent, integer())
        field(:acwr_status, String.t())
        field(:acwr_status_feedback, String.t())
        field(:daily_acute_chronic_workload_ratio, float())
        field(:daily_training_load_acute, integer())
        field(:daily_training_load_chronic, integer())
        field(:max_training_load_chronic, float())
        field(:min_training_load_chronic, float())
      end
    end

    defmodule Data do
      use Nimrag.Api.Data

      schematic_struct do
        field(:acute_training_load_dto, AcuteTrainingLoad.t(), json: "acuteTrainingLoadDTO")
        field(:calendar_date, Date.t())
        field(:device_id, integer())
        field(:fitness_trend, integer())
        field(:fitness_trend_sport, String.t())
        field(:load_level_trend, any(), nullable: true)
        field(:load_tunnel_max, any(), nullable: true)
        field(:load_tunnel_min, any(), nullable: true)
        field(:primary_training_device, boolean())
        field(:since_date, Date.t())
        field(:sport, String.t(), nullable: true)
        field(:sub_sport, String.t(), nullable: true)
        field(:timestamp, DateTime.t(), schema: timestamp_as_datetime())
        field(:training_paused, boolean())
        field(:training_status, integer())
        field(:training_status_feedback_phrase, String.t())
        field(:weekly_training_load, any(), nullable: true)
      end
    end

    schematic_struct do
      field(:last_primary_sync_date, Date.t())
      field(:latest_training_status_data, %{String.t() => Data.t()})
      field(:recorded_devices, [RecordedDevice.t()])
      field(:show_selector, boolean())
      field(:user_id, integer())
    end
  end

  defmodule VO2Max do
    use Nimrag.Api.Data

    defmodule Generic do
      use Nimrag.Api.Data

      schematic_struct do
        field(:calendar_date, Date.t())
        field(:fitness_age, integer(), nullable: true)
        field(:fitness_age_description, integer(), nullable: true)
        field(:max_met_category, integer())
        field(:vo2_max_precise_value, float())
        field(:vo2_max_value, float())
      end
    end

    defmodule HeatAltitudeAcclimation do
      use Nimrag.Api.Data

      schematic_struct do
        field(:acclimation_percentage, integer())
        field(:altitude_acclimation, integer())
        field(:altitude_acclimation_date, Date.t())
        field(:altitude_acclimation_local_timestamp, NaiveDateTime.t(), schema: naive_datetime())
        field(:altitude_trend, nil)
        field(:calendar_date, Date.t())
        field(:current_altitude, integer())
        field(:heat_acclimation_date, Date.t())
        field(:heat_acclimation_percentage, integer())
        field(:heat_trend, String.t(), nullable: true)
        field(:previous_acclimation_percentage, integer())
        field(:previous_altitude, integer())
        field(:previous_altitude_acclimation, integer())
        field(:previous_altitude_acclimation_date, Date.t())
        field(:previous_heat_acclimation_date, Date.t())
        field(:previous_heat_acclimation_percentage, integer())
      end
    end

    schematic_struct do
      field(:cycling, any(), nullable: true)
      field(:generic, Generic.t())
      field(:heat_altitude_acclimation, HeatAltitudeAcclimation.t(), nullable: true)
      field(:user_id, integer())
    end
  end

  schematic_struct do
    field(:heat_altitude_acclimation_dto, nil, json: "heatAltitudeAcclimationDTO", nullable: true)
    field(:most_recent_training_load_balance, LoadBalance.t(), nullable: true)
    field(:most_recent_training_status, Status.t(), nullable: true)
    field(:most_recent_vo2_max, VO2Max.t(), json: "mostRecentVO2Max", nullable: true)
    field(:user_id, integer())
  end
end
