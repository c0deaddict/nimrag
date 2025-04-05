defmodule Nimrag.Api.WeatherLocation do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          iso_country_code: nil | String.t(),
          latitude: nil | float(),
          longitude: nil | float(),
          location_name: nil | String.t(),
          postal_code: nil | String.t(),
          use_fixed_location: nil | bool()
        }

  defstruct ~w(
    iso_country_code
    latitude
    longitude
    location_name
    postal_code
    use_fixed_location
  )a

  def schematic() do
    schema(__MODULE__, %{
      field(:iso_country_code) => nullable(str()),
      field(:latitude) => nullable(float()),
      field(:longitude) => nullable(float()),
      field(:location_name) => nullable(str()),
      field(:postal_code) => nullable(str()),
      field(:use_fixed_location) => nullable(bool())
    })
  end
end
