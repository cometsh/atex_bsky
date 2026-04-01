defmodule Chat.Bsky.Convo.UpdateRead do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "convoId" => %{"type" => "string"},
              "messageId" => %{"type" => "string"}
            },
            "required" => ["convoId"],
            "type" => "object"
          }
        },
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
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.updateRead",
    "lexicon" => 1
  })
end
