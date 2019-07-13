# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fizzbuzz_phoenix, FizzBuzz.Repo,
  database: "fizzbuzz_phoenix_repo",
  username: "postgres",
  password: "postgre",
  hostname: "localhost"

# Configures the endpoint
config :fizzbuzz_phoenix, FizzbuzzPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qr7Rq+wtI3x6KCXq3Z344VQcTAPdUmkQEA7DzWyrkMiKNcnQbcBMzy7wUJOWz6mo",
  render_errors: [view: FizzbuzzPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FizzbuzzPhoenix.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :fizzbuzz_phoenix,
       ecto_repos: [FizzBuzz.Repo]

config :scrivener_html,
  routes_helper: FizzbuzzPhoenixWeb.Router.Helpers


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
