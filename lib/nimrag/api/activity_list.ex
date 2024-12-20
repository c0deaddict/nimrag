defmodule Nimrag.Api.ActivityList do
  use Nimrag.Api.Data
  alias Nimrag.Api.ActivityType

  @type t() :: %__MODULE__{
          activity_id: integer(),
          distance: float(),
          duration: float(),
          activity_name: String.t(),
          begin_at: DateTime.t(),
          start_local_at: NaiveDateTime.t(),
          average_hr: nil | float(),
          max_hr: nil | float(),
          elevation_gain: nil | float(),
          elevation_loss: nil | float(),
          description: nil | String.t(),
          activity_type: ActivityType.t(),
          location_name: nil | String.t(),
          steps: integer(),
          calories: float(),
          start_latitude: nil | float(),
          start_longitude: nil | float(),
          end_latitude: nil | float(),
          end_longitude: nil | float()
        }

  defstruct ~w(
    activity_id distance duration begin_at start_local_at activity_name description
    average_hr max_hr elevation_gain elevation_loss activity_type location_name
    steps calories start_latitude start_longitude end_latitude end_longitude
  )a

  def schematic() do
    schema(__MODULE__, %{
      # TODO: check methods
      {"beginTimestamp", :begin_at} => timestamp_as_datetime(),
      {"startTimeLocal", :start_local_at} => naive_datetime(),
      field(:activity_id) => int(),
      field(:activity_name) => str(),
      field(:description) => nullable(str()),
      field(:distance) => float(),
      field(:duration) => float(),
      {"averageHR", :average_hr} => nullable(float()),
      {"maxHR", :max_hr} => nullable(float()),
      field(:elevation_gain) => nullable(float()),
      field(:elevation_loss) => nullable(float()),
      field(:activity_type) => ActivityType.schematic(),
      field(:location_name) => nullable(str()),
      field(:steps) => int(),
      field(:calories) => float(),
      field(:start_latitude) => nullable(float()),
      field(:start_longitude) => nullable(float()),
      field(:end_latitude) => nullable(float()),
      field(:end_longitude) => nullable(float())
    })
  end
end
