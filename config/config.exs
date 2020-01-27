# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sentry_genserver_failure,
  ecto_repos: [SentryGenserverFailure.Repo]

# Configures the endpoint
config :sentry_genserver_failure, SentryGenserverFailureWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uLYy+eIxc2Iu/AuUcvKQBxxmaEPPHT4ZHvaHmyH8X1+A0gogMo4x30B91O2BssKA",
  render_errors: [view: SentryGenserverFailureWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SentryGenserverFailure.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :logger,
  backends: [:console, Sentry.LoggerBackend]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
