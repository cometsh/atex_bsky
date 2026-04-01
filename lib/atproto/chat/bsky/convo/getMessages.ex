defmodule Chat.Bsky.Convo.GetMessages do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "messages" => %{
                "items" => %{
                  "refs" => [
                    "chat.bsky.convo.defs#messageView",
                    "chat.bsky.convo.defs#deletedMessageView"
                  ],
                  "type" => "union"
                },
                "type" => "array"
              }
            },
            "required" => ["messages"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "convoId" => %{"type" => "string"},
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "required" => ["convoId"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.convo.getMessages",
    "lexicon" => 1
  })
end
