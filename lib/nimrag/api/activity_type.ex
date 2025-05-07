defmodule Nimrag.Api.ActivityType do
  use Nimrag.Api.Data

  schematic_struct do
    field(:is_hidden, boolean())
    field(:parent_type_id, integer())
    field(:restricted, boolean())
    field(:trimmable, boolean())
    field(:type_id, integer())
    field(:type_key, String.t())
  end
end
