import Config

config :api_emoji_craft,
  generators: [binary_id: true]

config :api_emoji_craft, ApiEmojiCraftWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [formats: [json: ApiEmojiCraftWeb.ErrorJSON], layout: false],
  pubsub_server: ApiEmojiCraft.PubSub

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
