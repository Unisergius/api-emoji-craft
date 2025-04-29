defmodule ApiEmojiCraftWeb.AuthController do
  use ApiEmojiCraftWeb, :controller
  plug ApiEmojiCraftWeb.DelayPlug, 2

  alias ApiEmojiCraft.Token

  def token(conn, _params) do
    case Token.generate!() do
      {:ok, token} ->
        json(conn, %{token: token, token_type: "bearer"})

      _ ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{error: "Failed to generate token"})
    end
  end
end
