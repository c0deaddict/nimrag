defmodule Nimrag.Api.HRV do
  use Nimrag.Api.Data

  defmodule HRVReading do
    use Nimrag.Api.Data

    schematic_struct do
      field(:hrv_value, integer())
      field(:reading_at, DateTime.t(), json: "readingTimeGMT", schema: gmt_datetime_as_datetime())

      field(:reading_local_at, NaiveDateTime.t(),
        json: "readingTimeLocal",
        schema: naive_datetime()
      )
    end
  end

  defmodule HRVBaseline do
    use Nimrag.Api.Data

    schematic_struct do
      field(:balanced_low, integer())
      field(:balanced_upper, integer())
      field(:low_upper, integer())
      field(:marker_value, float())
    end
  end

  defmodule HRVSummary do
    use Nimrag.Api.Data

    schematic_struct do
      field(:baseline, HRVBaseline.t())
      field(:calendar_date, Date.t())
      field(:created_at, DateTime.t(), json: "createTimeStamp", schema: gmt_datetime_as_datetime())
      field(:feedback_phrase, String.t())
      field(:last_night_5_min_high, integer())
      field(:last_night_avg, integer())
      field(:status, String.t())
      field(:weeklyAvg, integer())
    end
  end

  alias __MODULE__.{HRVReading, HRVSummary}

  schematic_struct do
    field(:end_at, DateTime.t(), json: "endTimestampGMT", schema: gmt_datetime_as_datetime())
    field(:end_local_at, NaiveDateTime.t(), json: "endTimestampLocal", schema: naive_datetime())
    field(:hrv_readings, [HRVReading.t()])
    field(:hrv_summary, HRVSummary.t())

    field(:sleep_end_at, DateTime.t(),
      json: "sleepEndTimestampGMT",
      schema: gmt_datetime_as_datetime()
    )

    field(:sleep_end_local_at, NaiveDateTime.t(),
      json: "sleepEndTimestampLocal",
      schema: naive_datetime()
    )

    field(:sleep_start_at, DateTime.t(),
      json: "sleepStartTimestampGMT",
      schema: gmt_datetime_as_datetime()
    )

    field(:sleep_start_local_at, NaiveDateTime.t(),
      json: "sleepStartTimestampLocal",
      schema: naive_datetime()
    )

    field(:start_at, DateTime.t(), json: "startTimestampGMT", schema: gmt_datetime_as_datetime())

    field(:start_local_at, NaiveDateTime.t(),
      json: "startTimestampLocal",
      schema: naive_datetime()
    )

    field(:user_profile_pk, integer())
  end
end
