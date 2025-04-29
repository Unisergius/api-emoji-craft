defmodule ApiEmojiCraft.RecipeLoader do
  @moduledoc "Loads emoji-crafting recipes from priv/recipes.json into ETS."

  alias ApiEmojiCraft.Emoji

  @table :recipes
  @filename "recipes.json"

  def load! do
    @filename
    |> priv_path()
    |> File.read!()
    |> Jason.decode!()
    |> Enum.each(fn %{"materials" => mats, "result" => res} ->
      :ets.insert(@table, {Emoji.sort(mats), res})
    end)
  end

  defp priv_path(rel) do
    :code.priv_dir(:api_emoji_craft)
    |> Path.join(rel)
  end
end
