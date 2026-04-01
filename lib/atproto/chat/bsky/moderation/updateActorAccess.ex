defmodule Chat.Bsky.Moderation.UpdateActorAccess do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actor" => %{"format" => "did", "type" => "string"},
              "allowAccess" => %{"type" => "boolean"},
              "ref" => %{"type" => "string"}
            },
            "required" => ["actor", "allowAccess"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.moderation.updateActorAccess",
    "lexicon" => 1
  })
end
