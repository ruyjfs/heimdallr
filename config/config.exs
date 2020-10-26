# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :heimdallr,
  ecto_repos: [Heimdallr.Repo]

# Configures the endpoint
config :heimdallr, HeimdallrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EjNfuSKO+TIdehl9r1+h1Gp+4fSDFNC2WGSXHecO/BI8vAqlZxQLxey6s9XmfDUY",
  render_errors: [view: HeimdallrWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Heimdallr.PubSub,
  live_view: [signing_salt: "MzK6AW1L"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :heimdallr, Heimdallr.Guardian,
  issuer: "heimdallr",
  #   verify_module: Guardian.JWT,
  #   serializer: Heimdallr.Guardian
  #   # secret_key: Mix.env(),
  secret_key: "tHKcly4mUCWEin/7PMDfGIwZsGwTwOAB+y1Z2uYU8OLrf3LuDbI9DKAz/dGAz5iP"
