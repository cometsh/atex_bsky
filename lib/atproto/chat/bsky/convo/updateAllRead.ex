defmodule Chat.Bsky.Convo.UpdateAllRead do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "status" => %{
                "knownValues" => ["request", "accepted"],
                "type" => "string"
              }
            },
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "updatedCount" => %{
                "description" => "The count of updated convos.",
                "type" => "integer"
              }
            },
            "required" => ["updatedCount"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.updateAllRead",
    "lexicon" => 1
  })
end
