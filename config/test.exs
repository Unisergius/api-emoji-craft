import Config



# We don't run a server during test. If one is required,ß
# you can enable the server option below.
config :api_emoji_craft, ApiEmojiCraftWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zlk0SO0lCk3x55F10WTf/k5KhYdbW4FEvk1BzwnU+5brUmrXhvFhACvvJ2Xm+nH8",
  server: false

# In test we don't send emails.
config :api_emoji_craft, ApiEmojiCraft.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
