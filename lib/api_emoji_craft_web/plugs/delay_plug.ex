defmodule ApiEmojiCraftWeb.DelayPlug do
  # import Plug.Conn

  def init(seconds), do: seconds
  def call(conn, seconds) do
    Process.sleep(seconds * 1000)
    conn
  end
end
