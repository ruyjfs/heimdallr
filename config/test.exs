use Mix.Config

# Configure your database
config :skeleton_elixir, SkeletonElixir.Repo,
  username: "postgres",
  password: "postgres",
  database: "skeleton_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :skeleton_elixir, SkeletonElixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
