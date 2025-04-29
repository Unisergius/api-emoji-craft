defmodule ApiEmojiCraftWeb.AuthPlug do
  import Plug.Conn

  def init(_opts), do: []

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         true <- :ets.member(:tokens, token) do
      assign(conn, :current_token, token)
    else
      _ -> conn |> send_resp(401, ~s({"error":"unauthorized"})) |> halt()
    end
  end

end
