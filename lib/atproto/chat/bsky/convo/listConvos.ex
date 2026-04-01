defmodule Chat.Bsky.Convo.ListConvos do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "convos" => %{
                "items" => %{
                  "ref" => "chat.bsky.convo.defs#convoView",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "cursor" => %{"type" => "string"}
            },
            "required" => ["convos"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "readState" => %{"knownValues" => ["unread"], "type" => "string"},
            "status" => %{
              "knownValues" => ["request", "accepted"],
              "type" => "string"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.convo.listConvos",
    "lexicon" => 1
  })
end
