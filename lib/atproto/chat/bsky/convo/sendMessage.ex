defmodule Chat.Bsky.Convo.SendMessage do
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
              "message" => %{
                "ref" => "chat.bsky.convo.defs#messageInput",
                "type" => "ref"
              }
            },
            "required" => ["convoId", "message"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "ref" => "chat.bsky.convo.defs#messageView",
            "type" => "ref"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.sendMessage",
    "lexicon" => 1
  })
end
