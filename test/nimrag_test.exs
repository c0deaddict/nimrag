defmodule NimragTest do
  use ExUnit.Case
  alias Nimrag
  import Nimrag.ApiHelper

  doctest Nimrag

  setup do
    Req.Test.stub(Nimrag.Api, fn conn ->
      Req.Test.json(conn, read_response_fixture(conn))
    end)
  end

  test "default rate limit" do
    Nimrag.RateLimiter.start_link([])

    client = %{client() | rate_limit: [module: Nimrag.RateLimiter, scale_ms: 5_000, limit: 0]}
    assert {:error, %Nimrag.RateLimitError{wait: wait}} = Nimrag.user_settings(client)
    assert wait > 0
  end

  test "custom rate limit" do
    defmodule RateLimiter do
      use Hammer, backend: :atomic
    end

    RateLimiter.start_link([])

    client = %{client() | rate_limit: [module: RateLimiter, scale_ms: 5_000, limit: 1]}
    assert {:ok, _user_settings, client} = Nimrag.user_settings(client)
    assert {:error, %Nimrag.RateLimitError{wait: wait}} = Nimrag.user_settings(client)
    assert wait > 0
  end

  test "#profile" do
    assert {:ok, _profile, _client} = Nimrag.profile(client())
  end

  test "#steps_daily" do
    assert {:ok, _steps_daily, _client} =
             Nimrag.steps_daily(client(), ~D|2024-04-06|, ~D|2024-04-06|)
  end

  test "#activities" do
    assert {:ok, _activities, _client} = Nimrag.activities(client(), offset: 0, limit: 1)
  end

  test "#user_settings" do
    assert {:ok, _user_settings, _client} = Nimrag.user_settings(client())
  end

  test "#user_summary" do
    assert {:ok, _user_summary, _client} = Nimrag.user_summary(client(), ~D[2025-05-06])
  end

  test "#steps_weekly" do
    assert {:ok, steps_weekly, _client} = Nimrag.steps_weekly(client(), ~D|2024-05-01|, 4)

    assert Enum.count(steps_weekly) == 4
    assert hd(steps_weekly).calendar_date == ~D[2024-04-04]
    # Garmin is very strange with "weekly" grouping...
    assert List.last(steps_weekly).calendar_date == ~D[2024-04-25]
  end

  test "#sleep_daily" do
    assert {:ok, %Nimrag.Api.SleepDaily{}, _client} =
             Nimrag.sleep_daily(client(), "arathunku", ~D|2024-05-01|, 60)
  end

  test "#activity" do
    assert {:ok, %Nimrag.Api.Activity{}, _client} = Nimrag.activity(client(), 15_205_844_761)
  end

  test "#activity_details" do
    assert {:ok, %Nimrag.Api.ActivityDetails{}, _client} =
             Nimrag.activity_details(client(), 15_205_844_761)
  end

  test "#hrv" do
    assert {:ok, %Nimrag.Api.HRV{}, _client} = Nimrag.hrv(client(), ~D[2025-03-28])
  end

  test "#intensity_minutes_daily" do
    assert {:ok, %Nimrag.Api.IntensityMinutesDaily{}, _client} =
             Nimrag.intensity_minutes_daily(client(), ~D[2025-04-05])
  end

  test "#devices" do
    assert {:ok, _devices, _client} = Nimrag.devices(client())
  end

  test "#device_settings" do
    assert {:ok, _devices, _client} = Nimrag.device_settings(client(), 123_456_789)
  end

  test "#training_readiness" do
    assert {:ok, _readiness, _client} = Nimrag.training_readiness(client(), ~D[2025-05-10])
  end

  test "#training_status" do
    assert {:ok, _status, _client} = Nimrag.training_status(client(), ~D[2025-05-10])
  end
end
