# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocktpay,
  ecto_repos: [Rocktpay.Repo]

# Configures the endpoint
config :rocktpay, RocktpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NLoOQlov5XSx3KfaUs8wYPbk3OeFqhv5VlLjUF3Zx0ZC++YT/So0D0nT1zcM0bd/",
  render_errors: [view: RocktpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocktpay.PubSub,
  live_view: [signing_salt: "aGxgqHlK"]

config :rocktpay, Rocktpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreing_key: [type: :binary_id]

config :rocktpay, :basic_auth,
  username: "banana",
  password: "nanica123"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
