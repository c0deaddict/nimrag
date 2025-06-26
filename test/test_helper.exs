ExUnit.start()

defmodule CustomRateLimiter do
  use Hammer, backend: :atomic
end

