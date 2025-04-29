import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :api_emoji_craft, ApiEmojiCraft.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "api_emoji_craft_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,ß
# you can enable the server option below.
config :api_emoji_craft, ApiEmojiCraftWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zlk0SO0lCk3x55F10WTf/k5KhYdbW4FEvk1BzwnU+5brUmrXhvFhACvvJ2Xm+nH8",
  server: false

# In test we don't send emails.
config :api_emoji_craft, ApiEmojiCraft.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
