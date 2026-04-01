defmodule Chat.Bsky.Convo.GetConvoAvailability do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get whether the requester and the other members can chat. If an existing convo is found for these members, it is returned.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "canChat" => %{"type" => "boolean"},
              "convo" => %{
                "ref" => "chat.bsky.convo.defs#convoView",
                "type" => "ref"
              }
            },
            "required" => ["canChat"],
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
    "id" => "chat.bsky.convo.getConvoAvailability",
    "lexicon" => 1
  })
end
