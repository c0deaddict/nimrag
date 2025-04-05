defmodule Nimrag.Api.UserSettings do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          id: integer(),
          user_data: Api.UserData.t(),
          user_sleep: Api.UserSleep.t(),
          user_sleep_windows: [Api.UserSleepWindow.t()],
          connect_date: nil | String.t(),
          source_type: nil | String.t()
        }

  defstruct ~w(
    id
    user_data
    user_sleep
    user_sleep_windows
    connect_date
    source_type
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:id) => int(),
      field(:user_data) => Api.UserData.schematic(),
      field(:user_sleep) => Api.UserSleep.schematic(),
      field(:user_sleep_windows) => list(Api.UserSleepWindow.schematic()),
      field(:connect_date) => nullable(str()),
      field(:source_type) => nullable(str())
    })
  end
end
