defmodule Chat.Bsky.Convo.AddReaction do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Adds an emoji reaction to a message. Requires authentication. It is idempotent, so multiple calls from the same user with the same emoji result in a single reaction.",
        "errors" => [
          %{
            "description" =>
              "Indicates that the message has been deleted and reactions can no longer be added/removed.",
            "name" => "ReactionMessageDeleted"
          },
          %{
            "description" =>
              "Indicates that the message has the maximum number of reactions allowed for a single user, and the requested reaction wasn't yet present. If it was already present, the request will not fail since it is idempotent.",
            "name" => "ReactionLimitReached"
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
    "id" => "chat.bsky.convo.addReaction",
    "lexicon" => 1
  })
end
