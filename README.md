# Nimrag

[![Actions Status](https://github.com/arathunku/nimrag/actions/workflows/elixir-build-and-test.yml/badge.svg)](https://github.com/arathunku/nimrag/actions/workflows/elixir-build-and-test.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/nimrag.svg?style=flat)](https://hex.pm/packages/nimrag)
[![Documentation](https://img.shields.io/badge/hex-docs-lightgreen.svg?style=flat)](https://hexdocs.pm/nimrag)
[![License](https://img.shields.io/hexpm/l/nimrag.svg?style=flat)](https://github.com/arathunku/nimrag/blob/main/LICENSE.md)

<!-- @moduledoc -->

Use Garmin API from Elixir. Fetch activities, steps, and more!

Nimrag is Garmin in reverse, because we have to reverse engineer the API and auth. ¯\_(ツ)_/¯

## Installation

The package can be installed by adding Nimrag to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nimrag, "~> 0.1.0"}
  ]
end
```

If you'd like to use it from Livebook, take a look at [this example](./examples/basic.livemd) or watch demo:

https://github.com/arathunku/nimrag/assets/749393/7246f688-4820-4276-96de-5d8ed7b2fd16

## Usage

### Initial auth

Garmin doesn't have any official public API for individuals, only businesses.
It means we're required to use username, password and (optionally) MFA code to obtain
OAuth tokens. OAuth1 token is valid for up to a year and it's used to generate
OAuth2 token that expires quickly, OAuth2 token is used for making the API calls.
After OAuth1 token expires, we need to repeat the authentication process.

Please see `Nimrag.Auth` docs for more details about authentication,
and see `Nimrag.Credentials` on how to avoid providing plaintext credentials directly in code.

```elixir
# If you're using it for the first time, we need to get OAuth Tokens first.
credentials = Nimrag.Credentials.new("username", "password")
# you may get prompted for MFA token on stdin
{:ok, client} = Nimrag.Auth.login_sso()

# OPTIONAL: If you'd like to store OAuth tokens in ~/.config/nimrag and not log in every time
:ok = Nimrag.Credentials.write_fs_oauth1_token(client)
:ok = Nimrag.Credentials.write_fs_oauth2_token(client)
```

### General

Use functions from `Nimrag` to fetch data from Garmin's API.

```elixir
# Restore previously cached in ~/.nimrag OAuth tokens
client = Nimrag.Client.new() |> Nimrag.Client.with_auth(Nimrag.Credentials.read_oauth_tokens!())

# Fetch your profile
{:ok, %Nimrag.Api.Profile{} = profile, client} = Nimrag.profile(client)

# Fetch your latest activity
{:ok, %Nimrag.Api.ActivityList{} = activity, client} = Nimrag.last_activity(client)

# Fetch your latest activity details
{:ok, %Nimrag.Api.ActivityDetails{} = activity, client} = Nimrag.activity_details(client, activity.activity_id)

# Call at the end of the session to cache new OAuth2 token
:ok = Nimrag.Credentials.write_fs_oauth2_token(client)
```

### Fallback to raw responses

`Nimrag` module has also functions with `_req` suffix. They return `{:ok, Req.Response{}, client}` and
do not process nor validate returned body. Other functions may return, if applicable,
structs with known fields.

This is very important split between response and transformation. Garmin's API may change
at any time but it should still be possible to fallback to raw response if needed, so that
any user of the library didn't have to wait for a fix.

API calls return `{:ok, data, client}` or `{:error, error}`. On success, client is there
so that it could be chained with always up to date OAuth2 token that will get
automatically updated when it's near expiration.

There's at this moment no extensive coverage of API endpoints, feel free to submit
PR with new structs and endpoints, see [Contributing](#contributing).

### Rate limit

By default, Nimrag uses [Hammer](https://github.com/ExHammer/hammer) for rate limiting requests.
The default rate limiter is in a module named `Nimrag.RateLimit`. You need to add this module to your application's Supervisor.

By default, Hammer's ETS based backend will be started.

> #### API note {: .warning}
> Nimrag is not using public Garmin's API so please be good citizens and don't hammer their servers.

See `Nimrag.Client.new/1` for more details about changing the api limits.

## Contributing

Please do! Garmin has a lot of endpoints, some are useful, some are less useful and
responses contain a lot of fields!

You can discover new endpoints by setting up [mitmproxy](https://mitmproxy.org/) and capturing
traffic from mobile app or website. You can also take a look at
[python-garminconnect](https://github.com/cyberjunky/python-garminconnect/blob/master/garminconnect/__init__.py).

For local setup, the project has minimal dependencies and is easy to install

```sh
# fork and clone the repo
$ mix deps.get
# ensure everything works!
$ mix check
# do your changes
$ mix check
# submit PR!
# THANK YOU!
```

### How to add new API endpoints, fields

1. Add new function in `Nimrag` module, one with `_req` suffix and one without.
  Functions with `_req` should returns direct `Nimrag.Api` result.
1. Call `_req` function in `test` env and save its response as fixture.

    Example for `Nimrag.profile/1`:

    ```elixir
    $ MIX_ENV=test iex -S mix
    client = Nimrag.Client.new() |> Nimrag.Client.with_auth(Nimrag.Credentials.read_oauth_tokens!())
    client |> Nimrag.profile_req() |> Nimrag.ApiHelper.store_response_as_test_fixture()
    ```

1. Add tests for new function in [`test/nimrag_test.exs`]
1. Define new [`Schematic`](https://github.com/mhanberg/schematic) schema in `Nimrag.Api`,
  and ensure all tests pass.


### Data structure

- Any method returning API's data returns it as a struct, with known fields.
- When Garmin removes any of the fields, they'll be removed here too.
- Garmin API is consistenly inconsistent where it comes to timestamps - sometimes they're formatted,
sometimes they're unix timestamp, even for the fields on the same name. Nimrag changes all datetimes
without timezone into NaiveDateTime "as is", and all "GMT" timestamps by Garmin are DateTime with Etc/UTC
timezone. All fields with NaiveDateTime/DateTime end with `_at`

## License

Copyright © 2024 Michal Forys

This project is licensed under the MIT license.
