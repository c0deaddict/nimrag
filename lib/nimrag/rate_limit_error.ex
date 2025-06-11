defmodule Nimrag.RateLimitError do
  defexception [:wait]

  def message(_) do
    "rate limit hit"
  end
end
