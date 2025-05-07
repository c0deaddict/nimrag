defmodule Nimrag.Api.ActivityDetails do
  use Nimrag.Api.Data

  schematic_struct do
    field(:activity_id, integer())

    field(:metric_descriptors, list(map()),
      schema:
        list(
          map(%{
            field(:key) => str(),
            field(:metrics_index) => int(),
            field(:unit) =>
              map(%{
                field(:factor) => float(),
                field(:id) => int(),
                field(:key) => str()
              })
          })
        )
    )

    field(:measurement_count, integer())

    field(:activity_detail_metrics, list(map()),
      schema: list(map(%{field(:metrics) => list(nullable(float()))}))
    )
  end
end
