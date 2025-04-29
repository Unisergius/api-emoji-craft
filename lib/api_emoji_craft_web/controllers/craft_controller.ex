defmodule ApiEmojiCraftWeb.CraftController do
  use ApiEmojiCraftWeb, :controller
  plug ApiEmojiCraftWeb.DelayPlug, 5
  plug ApiEmojiCraftWeb.AuthPlug

  def craft(conn, %{"materials" => list}) when is_list(list) do
    key     = Enum.sort(list)
    recipe  = :ets.lookup(:recipes, key)

    case recipe do
      [{^key, product}] ->
        json(conn, %{crafted: product})

      [] ->
        conn
        |> put_status(422)
        |> json(%{error: "unknown recipe", supplied: list})
    end
  end

  def craft(conn, _), do: send_resp(conn, 400, ~s({"error":"materials list required"}))
end
