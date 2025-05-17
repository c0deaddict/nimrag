defmodule Nimrag.RateLimitError do
  defexception [:rate_limit]

  def message(_) do
    "rate limit hit"
  end
end
