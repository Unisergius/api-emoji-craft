defmodule ApiEmojiCraftWeb.MaterialController do
  use ApiEmojiCraftWeb, :controller
  plug ApiEmojiCraftWeb.DelayPlug, 3
  plug ApiEmojiCraftWeb.AuthPlug

  @materials ~w(🪨 🌳 💧 🔥 ❄️ 🪓)a

  def random(conn, _params) do
    json(conn, %{material: Enum.random(@materials)})
  end
end
