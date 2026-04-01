defmodule Chat.Bsky.Convo.DeleteMessageForSelf do
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
            "required" => ["convoId", "messageId"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "ref" => "chat.bsky.convo.defs#deletedMessageView",
            "type" => "ref"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.deleteMessageForSelf",
    "lexicon" => 1
  })
end
