defmodule Nimrag.Api.UserSleepWindow do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          sleep_window_frequency: String.t(),
          start_sleep_time_seconds_from_midnight: integer(),
          end_sleep_time_seconds_from_midnight: integer()
        }

  defstruct ~w(
    sleep_window_frequency
    start_sleep_time_seconds_from_midnight
    end_sleep_time_seconds_from_midnight
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:sleep_window_frequency) => oneof([weekday(), "DAILY"]),
      field(:start_sleep_time_seconds_from_midnight) => int(),
      field(:end_sleep_time_seconds_from_midnight) => int()
    })
  end
end
