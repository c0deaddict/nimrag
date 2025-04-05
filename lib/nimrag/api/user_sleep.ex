defmodule Nimrag.Api.UserSleep do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          default_sleep_time: bool(),
          default_wake_time: bool(),
          sleep_time: integer(),
          wake_time: integer()
        }

  defstruct ~w(
    default_sleep_time
    default_wake_time
    sleep_time
    wake_time
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:default_sleep_time) => bool(),
      field(:default_wake_time) => bool(),
      field(:sleep_time) => int(),
      field(:wake_time) => int()
    })
  end
end
