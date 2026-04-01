defmodule Chat.Bsky.Moderation.GetMessageContext do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
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
            "after" => %{"default" => 5, "type" => "integer"},
            "before" => %{"default" => 5, "type" => "integer"},
            "convoId" => %{
              "description" =>
                "Conversation that the message is from. NOTE: this field will eventually be required.",
              "type" => "string"
            },
            "messageId" => %{"type" => "string"}
          },
          "required" => ["messageId"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.moderation.getMessageContext",
    "lexicon" => 1
  })
end
