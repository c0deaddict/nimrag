defmodule Nimrag.Api.WeatherLocation do
  use Nimrag.Api.Data

  @type t() :: %__MODULE__{
          iso_country_code: String.t(),
          latitude: float(),
          longitude: float(),
          location_name: String.t(),
          postal_code: String.t(),
          use_fixed_location: bool(),
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
      field(:iso_country_code) => str(),
      field(:latitude) => float(),
      field(:longitude) => float(),
      field(:location_name) => str(),
      field(:postal_code) => str(),
      field(:use_fixed_location) => bool()
    })
  end
end
