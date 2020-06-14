# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kaniko_test,
  ecto_repos: [KanikoTest.Repo]

# Configures the endpoint
config :kaniko_test, KanikoTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RhFQbfRFrsXl/922D5l+3D8beSpKtGoKBoN10u3o6rpzmMnEX6y1odqGord1fBwy",
  render_errors: [view: KanikoTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KanikoTest.PubSub,
  live_view: [signing_salt: "AJgHYeRk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
