defmodule Chat.Bsky.Actor.Declaration do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "A declaration of a Bluesky chat account.",
        "key" => "literal:self",
        "record" => %{
          "properties" => %{
            "allowIncoming" => %{
              "knownValues" => ["all", "none", "following"],
              "type" => "string"
            }
          },
          "required" => ["allowIncoming"],
          "type" => "object"
        },
        "type" => "record"
      }
    },
    "id" => "chat.bsky.actor.declaration",
    "lexicon" => 1
  })
end
