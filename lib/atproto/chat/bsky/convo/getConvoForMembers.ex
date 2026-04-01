defmodule Chat.Bsky.Convo.GetConvoForMembers do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "convo" => %{
                "ref" => "chat.bsky.convo.defs#convoView",
                "type" => "ref"
              }
            },
            "required" => ["convo"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "members" => %{
              "items" => %{"format" => "did", "type" => "string"},
              "maxLength" => 10,
              "minLength" => 1,
              "type" => "array"
            }
          },
          "required" => ["members"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.convo.getConvoForMembers",
    "lexicon" => 1
  })
end
