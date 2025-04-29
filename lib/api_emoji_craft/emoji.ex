defmodule ApiEmojiCraft.Emoji do
  @moduledoc """
  Utility helpers for working with emoji strings.
  """

  @doc """
  Deterministically orders a collection of emojis.

  Accepts:

    * **list** – `["🔥", "🪨", "🌳"]`
    * **string** – `"🔥,🪨,🌳"`

  Returns a *list* of emojis, sorted lexicographically by Unicode
  codepoint sequence.

  ## Examples

      iex> ApiEmojiCraft.Emoji.sort(["🪨", "🔥"])
      ["🔥", "🪨"]

      iex> ApiEmojiCraft.Emoji.sort("🧊,❄️,💧")
      ["💧", "❄️", "🧊"]
  """
  @spec sort(list(String.t()) | String.t()) :: list(String.t())
  def sort(emojis) when is_binary(emojis) do
    emojis
    |> String.split([",", " ", "\n", "\t"], trim: true, parts: :infinity)
    |> sort()
  end

  def sort(emojis) when is_list(emojis) do
    emojis
    |> Enum.map(&String.normalize(&1, :nfc))
    |> Enum.sort()
  end

  @doc """
  Returns a list of all emojis in the given string, sorted.
  """
  @spec is_emoji?(String.t()) :: boolean
  def is_emoji?(string) do
    string
    |> String.graphemes()
    |> Enum.all?(&is_emoji?/1)
  end
end
