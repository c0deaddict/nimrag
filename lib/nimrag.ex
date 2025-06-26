defmodule Nimrag do
  alias Nimrag.Api
  alias Nimrag.Client
  import Nimrag.Api, only: [get: 2, response_as_data: 2]

  @type error() :: {:error, any}

  @moduledoc "README.md"
             |> File.read!()
             |> String.split("<!-- @moduledoc -->")
             |> Enum.fetch!(1)
  @external_resource "README.md"

  @doc """
  Gets full profile
  """
  @spec profile(Client.t()) :: {:ok, Api.Profile.t(), Client.t()} | error()
  def profile(client), do: client |> profile_req() |> response_as_data(Api.Profile)
  def profile_req(client), do: get(client, url: "/userprofile-service/socialProfile")

  @doc """
  Gets number of completed and goal steps for each day.

  Start date must be equal or before end date.

  Avoid requesting too big ranges as it may fail.
  """
  @spec steps_daily(Client.t()) :: {:ok, list(Api.StepsDaily.t()), Client.t()} | error()
  @spec steps_daily(Client.t(), start_date :: Date.t()) ::
          {:ok, list(Api.StepsDaily.t()), Client.t()} | error()
  @spec steps_daily(Client.t(), start_date :: Date.t(), end_date :: Date.t()) ::
          {:ok, list(Api.StepsDaily.t()), Client.t()} | error()
  def steps_daily(client, start_date \\ Date.utc_today(), end_date \\ Date.utc_today()) do
    if Date.before?(end_date, start_date) do
      {:error,
       {:invalid_date_range, "Start date must be eq or earlier than end date.", start_date,
        end_date}}
    else
      client |> steps_daily_req(start_date, end_date) |> response_as_data(Api.StepsDaily)
    end
  end

  def steps_daily_req(client, start_date \\ Date.utc_today(), end_date \\ Date.utc_today()) do
    get(client,
      url: "/usersummary-service/stats/steps/daily/:start_date/:end_date",
      path_params: [start_date: Date.to_iso8601(start_date), end_date: Date.to_iso8601(end_date)]
    )
  end

  @doc """
  Gets number of completed and goal steps per week.
  """
  @spec steps_weekly(Client.t()) :: {:ok, list(Api.StepsWeekly.t()), Client.t()} | error()
  @spec steps_weekly(Client.t(), end_date :: Date.t()) ::
          {:ok, list(Api.StepsWeekly.t()), Client.t()} | error()
  @spec steps_weekly(Client.t(), end_date :: Date.t(), weeks_count :: integer()) ::
          {:ok, list(Api.StepsWeekly.t()), Client.t()} | error()
  def steps_weekly(client, end_date \\ Date.utc_today(), weeks_count \\ 1) do
    client |> steps_weekly_req(end_date, weeks_count) |> response_as_data(Api.StepsWeekly)
  end

  def steps_weekly_req(client, end_date \\ Date.utc_today(), weeks_count \\ 1) do
    get(client,
      url: "/usersummary-service/stats/steps/weekly/:end_date/:weeks_count",
      path_params: [end_date: Date.to_iso8601(end_date), weeks_count: weeks_count]
    )
  end

  @doc """
  Gets a full summary of a given day.
  """
  @spec user_summary(Client.t()) :: {:ok, list(Api.UserSummaryDaily.t()), Client.t()} | error()
  @spec user_summary(Client.t(), start_day :: Date.t()) ::
          {:ok, Api.UserSummaryDaily.t(), Client.t()} | error()
  def user_summary(client, date \\ Date.utc_today()),
    do: client |> user_summary_req(date) |> response_as_data(Api.UserSummaryDaily)

  def user_summary_req(client, date) do
    get(client,
      url: "/usersummary-service/usersummary/daily",
      params: [calendarDate: Date.to_iso8601(date)]
    )
  end

  @doc """
  Gets latest activity
  """
  @spec last_activity(Client.t()) :: {:ok, Api.ActivityList.t(), Client.t()} | error()
  def last_activity(client) do
    case activities(client, offset: 0, limit: 1) do
      {:ok, [], _client} -> {:error, :not_found}
      {:ok, [activity | _], client} -> {:ok, activity, client}
      result -> result
    end
  end

  @doc """
  Gets activity with given ID.

  Note: this doesn't return the same data structure as a list of activities!
  """
  @spec activity(Client.t(), integer()) :: {:ok, Api.Activity.t(), Client.t()} | error()
  def activity(client, id) when is_integer(id) or is_bitstring(id),
    do: client |> activity_req(id) |> response_as_data(Api.Activity)

  def activity_req(client, id),
    do: get(client, url: "/activity-service/activity/:id", path_params: [id: id])

  @doc """
  Gets details for activitiy with given ID
  """
  @spec activity_details(Client.t(), integer()) ::
          {:ok, Api.ActivityDetails.t(), Client.t()} | error()
  def activity_details(client, id) when is_integer(id) or is_bitstring(id),
    do: client |> activity_details_req(id) |> response_as_data(Api.ActivityDetails)

  def activity_details_req(client, id),
    do: get(client, url: "/activity-service/activity/:id/details", path_params: [id: id])

  @doc """
  Gets activities
  """
  @type activities_opt ::
          {:offset, integer()}
          | {:limit, integer()}
          | {:start_date, Date.t()}
          | {:end_date, Date.t()}
          | {:ascending, bool()}
          | {:activity_type, String.t()}

  @spec activities(Client.t(), [activities_opt]) ::
          {:ok, list(Api.ActivityList.t()), Client.t()} | error()
  def activities(client, opts \\ []) do
    client
    |> activities_req(Keyword.merge([offset: 0, limit: 10], opts))
    |> response_as_data(Api.ActivityList)
  end

  defp activities_param({:start_date, d}), do: {:startDate, Date.to_iso8601(d)}
  defp activities_param({:end_date, d}), do: {:endDate, Date.to_iso8601(d)}
  defp activities_param({:ascending, true}), do: {:sortOrder, "asc"}
  defp activities_param({:ascending, _}), do: {:sortOrder, "desc"}
  defp activities_param({:activity_type, type}), do: {:activityType, type}
  defp activities_param({:offset, offset}), do: {:start, offset}
  defp activities_param({k, v}), do: {k, v}

  def activities_req(client, opts) do
    get(client,
      url: "/activitylist-service/activities/search/activities",
      params: Enum.map(opts, &activities_param/1)
    )
  end

  @doc """
  Downloads activity.

  Activity download artifact - if original format is used, it's a zip and you
  still need to decode it.

  CSV download is contains a summary of splits.

  ## Working with original zip file

  ```elixir
  {:ok, zip, client} = Nimrag.download_activity(client, 123, :raw)
  {:ok, [{_filename, data}]} = :zip.extract(zip, [:memory])
  # Use https://github.com/arathunku/ext_fit to decode FIT file
  {:ok, records} = data |> ExtFit.Decode.decode()
  ```
  """
  @spec download_activity(Client.t(), activity_id :: integer(), :raw) ::
          {:ok, binary(), Client.t()} | error()
  @spec download_activity(Client.t(), activity_id :: integer(), :tcx) ::
          {:ok, binary(), Client.t()} | error()
  @spec download_activity(Client.t(), activity_id :: integer(), :gpx) ::
          {:ok, binary(), Client.t()} | error()
  @spec download_activity(Client.t(), activity_id :: integer(), :kml) ::
          {:ok, binary(), Client.t()} | error()
  @spec download_activity(Client.t(), activity_id :: integer(), :csv) ::
          {:ok, binary(), Client.t()} | error()
  def download_activity(client, activity_id, :raw)
      when is_integer(activity_id) or is_bitstring(activity_id) do
    with {:ok, %{body: body, status: 200}, client} <-
           download_activity_req(client,
             prefix_url: "download-service/files/activity",
             activity_id: activity_id
           ) do
      {:ok, body, client}
    end
  end

  def download_activity(client, activity_id, format) when format in ~w(tcx gpx kml csv)a do
    with {:ok, %{body: body, status: 200}, client} <-
           download_activity_req(client,
             prefix_url: "download-service/export/#{format}/activity",
             activity_id: activity_id
           ) do
      {:ok, body, client}
    end
  end

  @doc false
  def download_activity_req(client, path_params) do
    get(client,
      url: ":prefix_url/:activity_id",
      path_params: path_params
    )
  end

  @doc """
  Returns user settings
  """
  @spec user_settings(Client.t()) :: {:ok, Api.UserSettings.t(), Client.t()} | error()
  def user_settings(client),
    do: client |> user_settings_req() |> response_as_data(Api.UserSettings)

  def user_settings_req(client),
    do: get(client, url: "/userprofile-service/userprofile/user-settings")

  @doc """
  Gets sleep data for a given day.
  """
  @spec sleep_daily(Client.t(), username :: String.t()) ::
          {:ok, list(Api.SleepDaily.t()), Client.t()} | error()
  @spec sleep_daily(Client.t(), username :: String.t(), date :: Date.t()) ::
          {:ok, list(Api.SleepDaily.t()), Client.t()} | error()
  @spec sleep_daily(Client.t(), username :: String.t(), date :: Date.t(), integer()) ::
          {:ok, list(Api.SleepDaily.t()), Client.t()} | error()
  def sleep_daily(client, username, date \\ Date.utc_today(), buffer_minutes \\ 60)
      when is_bitstring(username) do
    client |> sleep_daily_req(username, date, buffer_minutes) |> response_as_data(Api.SleepDaily)
  end

  def sleep_daily_req(client, username, date \\ Date.utc_today(), buffer_minutes \\ 60) do
    get(client,
      url: "/wellness-service/wellness/dailySleepData/:username",
      params: [nonSleepBufferMinutes: buffer_minutes, date: Date.to_iso8601(date)],
      path_params: [username: username]
    )
  end

  @doc """
  Get Heart Rate Variability (HRV) data for current user.
  """
  @spec hrv(Client.t()) :: {:ok, Api.HRV.t(), Client.t()} | error()
  @spec hrv(Client.t(), date :: Date.t()) :: {:ok, Api.HRV.t(), Client.t()} | error()
  def hrv(client, date \\ Date.utc_today()),
    do: client |> hrv_req(date) |> response_as_data(Api.HRV)

  def hrv_req(client, date),
    do:
      get(client,
        url: "/hrv-service/hrv/:date",
        path_params: [date: Date.to_iso8601(date)]
      )

  @doc """
  Get intensity minutes data for current user.
  """
  @spec intensity_minutes_daily(Client.t()) ::
          {:ok, Api.IntensityMinutesDaily.t(), Client.t()} | error()
  @spec intensity_minutes_daily(Client.t(), date :: Date.t()) ::
          {:ok, Api.IntensityMinutesDaily.t(), Client.t()} | error()
  def intensity_minutes_daily(client, date \\ Date.utc_today()),
    do: client |> intensity_minutes_daily_req(date) |> response_as_data(Api.IntensityMinutesDaily)

  def intensity_minutes_daily_req(client, date),
    do:
      get(client,
        url: "/wellness-service/wellness/daily/im/:date",
        path_params: [date: Date.to_iso8601(date)]
      )

  @doc """
  Get available devices for the current user account.
  """
  @spec devices(Client.t()) ::
          {:ok, [Api.Device.t()], Client.t()} | error()
  def devices(client),
    do: client |> devices_req() |> response_as_data(Api.Device)

  def devices_req(client), do: get(client, url: "/device-service/deviceregistration/devices")

  @doc """
  Get device settings for device with 'device_id'.
  """
  @spec device_settings(Client.t(), device_id :: String.t()) ::
          {:ok, Api.DeviceSettings.t(), Client.t()} | error()
  def device_settings(client, device_id),
    do: client |> device_settings_req(device_id) |> response_as_data(Api.DeviceSettings)

  def device_settings_req(client, device_id),
    do:
      get(client,
        url: "/device-service/deviceservice/device-info/settings/:device_id",
        path_params: [device_id: device_id]
      )

  @doc """
  Get training readiness data for a given day.
  """
  @spec training_readiness(Client.t()) ::
          {:ok, Api.TrainingReadiness.t(), Client.t()} | error()
  @spec training_readiness(Client.t(), date :: Date.t()) ::
          {:ok, Api.TrainingReadiness.t(), Client.t()} | error()
  def training_readiness(client, date \\ Date.utc_today()),
    do: client |> training_readiness_req(date) |> response_as_data(Api.TrainingReadiness)

  def training_readiness_req(client, date),
    do:
      get(client,
        url: "/metrics-service/metrics/trainingreadiness/:date",
        path_params: [date: Date.to_iso8601(date)]
      )

  @doc """
  Get training status data for a given day.
  """
  @spec training_status(Client.t()) ::
          {:ok, Api.TrainingStatus.t(), Client.t()} | error()
  @spec training_status(Client.t(), date :: Date.t()) ::
          {:ok, Api.TrainingStatus.t(), Client.t()} | error()
  def training_status(client, date \\ Date.utc_today()),
    do: client |> training_status_req(date) |> response_as_data(Api.TrainingStatus)

  def training_status_req(client, date),
    do:
      get(client,
        url: "/metrics-service/metrics/trainingstatus/aggregated/:date",
        path_params: [date: Date.to_iso8601(date)]
      )

  @doc """
  Get weigh ins in date range.
  """
  @spec weigh_ins(Client.t()) :: {:ok, Api.WeighIns.t(), Client.t()} | error()
  @spec weigh_ins(Client.t(), start_date :: Date.t()) ::
          {:ok, Api.WeighIns.t(), Client.t()} | error()
  @spec weigh_ins(Client.t(), start_date :: Date.t(), end_date :: Date.t()) ::
          {:ok, Api.WeighIns.t(), Client.t()} | error()
  def weigh_ins(client, start_date \\ Date.utc_today(), end_date \\ Date.utc_today()) do
    if Date.before?(end_date, start_date) do
      {:error,
       {:invalid_date_range, "Start date must be eq or earlier than end date.", start_date,
        end_date}}
    else
      client |> weigh_ins_req(start_date, end_date) |> response_as_data(Api.WeighIns)
    end
  end

  def weigh_ins_req(client, start_date, end_date),
    do:
      get(client,
        url: "/weight-service/weight/range/:start_date/:end_date",
        params: [includeAll: true],
        path_params: [start_date: Date.to_iso8601(start_date), end_date: Date.to_iso8601(end_date)]
      )
end
