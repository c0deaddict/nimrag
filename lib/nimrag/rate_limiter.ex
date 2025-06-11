defmodule Nimrag.RateLimiter do
  use Hammer, backend: :atomic
end
