defmodule Chat.Bsky.Convo.RemoveReaction do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Removes an emoji reaction from a message. Requires authentication. It is idempotent, so multiple calls from the same user with the same emoji result in that reaction not being present, even if it already wasn't.",
        "errors" => [
          %{
            "description" =>
              "Indicates that the message has been deleted and reactions can no longer be added/removed.",
            "name" => "ReactionMessageDeleted"
          },
          %{
            "description" =>
              "Indicates the value for the reaction is not acceptable. In general, this means it is not an emoji.",
            "name" => "ReactionInvalidValue"
          }
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "convoId" => %{"type" => "string"},
              "messageId" => %{"type" => "string"},
              "value" => %{
                "maxGraphemes" => 1,
                "maxLength" => 64,
                "minGraphemes" => 1,
                "minLength" => 1,
                "type" => "string"
              }
            },
            "required" => ["convoId", "messageId", "value"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "message" => %{
                "ref" => "chat.bsky.convo.defs#messageView",
                "type" => "ref"
              }
            },
            "required" => ["message"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.removeReaction",
    "lexicon" => 1
  })
end
