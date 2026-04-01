defmodule Chat.Bsky.Actor.DeleteAccount do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.actor.deleteAccount",
    "lexicon" => 1
  })
end
