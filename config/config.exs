# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :skeleton_elixir,
  ecto_repos: [SkeletonElixir.Repo]

# Configures the endpoint
config :skeleton_elixir, SkeletonElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zg6poILJ3737p6ab3b0xZ1NqXiljOlpyJD2v7sNMe/Ga9wB7vOzTAgAZXQEtMuZD",
  render_errors: [view: SkeletonElixirWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SkeletonElixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
