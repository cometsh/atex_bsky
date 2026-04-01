defmodule Chat.Bsky.Convo.SendMessageBatch do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "batchItem" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "ref" => "chat.bsky.convo.defs#messageInput",
            "type" => "ref"
          }
        },
        "required" => ["convoId", "message"],
        "type" => "object"
      },
      "main" => %{
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "items" => %{
                "items" => %{"ref" => "#batchItem", "type" => "ref"},
                "maxLength" => 100,
                "type" => "array"
              }
            },
            "required" => ["items"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "items" => %{
                "items" => %{
                  "ref" => "chat.bsky.convo.defs#messageView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["items"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.sendMessageBatch",
    "lexicon" => 1
  })
end
