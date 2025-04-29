defmodule ApiEmojiCraftWeb.Router do
  use ApiEmojiCraftWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiEmojiCraftWeb do
    pipe_through :api

    get  "/auth/token",       AuthController,    :token
    get  "/materials/random", MaterialController, :random
    post "/emojis/craft",     CraftController, :craft
    get  "/emojis/all",       CraftController, :all
  end
end
