# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :toltec,
  ecto_repos: [Toltec.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :toltec, ToltecWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7PCOMHmfWjcBsRyTH0e9t0qH2VKmeYD6qWsehmtma3Spo2VzXE9cLpLc/78iFF8t",
  render_errors: [view: ToltecWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Toltec.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
