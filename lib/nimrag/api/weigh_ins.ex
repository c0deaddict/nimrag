defmodule Nimrag.Api.WeighIns do
  use Nimrag.Api.Data

  defmodule Measurement do
    use Nimrag.Api.Data

    schematic_struct do
      field(:bmi, float(), nullable: true)
      field(:body_fat, float(), nullable: true)
      field(:body_water, float(), nullable: true)
      field(:bone_mass, float(), nullable: true)
      field(:calendar_date, Date.t(), nullable: true)
      field(:date, DateTime.t(), schema: timestamp_as_datetime(), nullable: true)
      field(:metabolic_age, integer(), nullable: true)
      field(:muscle_mass, float(), nullable: true)
      field(:physique_rating, float(), nullable: true)
      field(:sample_pk, integer(), nullable: true)
      field(:source_type, String.t(), nullable: true)

      field(:timestamp, DateTime.t(),
        json: "timestampGMT",
        schema: timestamp_as_datetime(),
        nullable: true
      )

      field(:visceral_fat, float(), nullable: true)
      field(:weight, float(), nullable: true)
      field(:weight_delta, float(), nullable: true)
    end
  end

  defmodule DailySummaries do
    use Nimrag.Api.Data

    schematic_struct do
      field(:all_weight_metrics, list(Measurement.t()))
      field(:latest_weight, Measurement.t())
      field(:max_weight, float())
      field(:min_weight, float())
      field(:num_of_weight_entries, integer())
      field(:summary_date, Date.t())
    end
  end

  defmodule TotalAverage do
    use Nimrag.Api.Data

    schematic_struct do
      field(:bmi, float(), nullable: true)
      field(:body_fat, float(), nullable: true)
      field(:body_water, float(), nullable: true)
      field(:bone_mass, float(), nullable: true)
      field(:from, DateTime.t(), schema: timestamp_as_datetime())
      field(:metabolic_age, integer(), nullable: true)
      field(:muscle_mass, float(), nullable: true)
      field(:physique_rating, float(), nullable: true)
      field(:until, DateTime.t(), schema: timestamp_as_datetime())
      field(:visceral_fat, float(), nullable: true)
      field(:weight, float(), nullable: true)
    end
  end

  schematic_struct do
    field(:daily_weight_summaries, list(DailySummaries.t()))
    field(:next_date_weight, Measurement.t())
    field(:previous_date_weight, Measurement.t())
    field(:total_average, TotalAverage.t())
  end
end
