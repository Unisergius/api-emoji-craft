defmodule ApiEmojiCraft.Application do
  use Application
  alias ApiEmojiCraft.Emoji

  @impl true
  def start(_type, _args) do

    init_ets_tables()

    preload_recipes()

    children = [
      ApiEmojiCraftWeb.Endpoint
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ApiEmojiCraft.Supervisor)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ApiEmojiCraftWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def init_ets_tables do
    :ets.new(:tokens,   [:set, :public, :named_table, read_concurrency: true])
    :ets.new(:recipes,  [:set, :public, :named_table, read_concurrency: true])
  end

  def insert_recipe(materials, product) do
    :ets.insert(:recipes, {Emoji.sort(materials), product})
  end


  def preload_recipes do
    ApiEmojiCraft.RecipeLoader.load!()
  end

end
