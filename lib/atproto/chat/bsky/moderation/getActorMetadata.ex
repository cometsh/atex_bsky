defmodule Chat.Bsky.Moderation.GetActorMetadata do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "all" => %{"ref" => "#metadata", "type" => "ref"},
              "day" => %{"ref" => "#metadata", "type" => "ref"},
              "month" => %{"ref" => "#metadata", "type" => "ref"}
            },
            "required" => ["day", "month", "all"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{"actor" => %{"format" => "did", "type" => "string"}},
          "required" => ["actor"],
          "type" => "params"
        },
        "type" => "query"
      },
      "metadata" => %{
        "properties" => %{
          "convos" => %{"type" => "integer"},
          "convosStarted" => %{"type" => "integer"},
          "messagesReceived" => %{"type" => "integer"},
          "messagesSent" => %{"type" => "integer"}
        },
        "required" => ["messagesSent", "messagesReceived", "convos", "convosStarted"],
        "type" => "object"
      }
    },
    "id" => "chat.bsky.moderation.getActorMetadata",
    "lexicon" => 1
  })
end
