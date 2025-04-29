defmodule ApiEmojiCraft.Token do
  @table :tokens

  @moduledoc """
  A module for managing API tokens using ETS (Erlang Term Storage).
  """

  def generate! do
    token = UUID.uuid4()
    :ets.insert(@table, {token, System.system_time(:second)})
    {:ok, token }
  end

  def valid?(token), do: :ets.member(@table, token)
  def revoke!(token), do: :ets.delete(@table, token)
end
