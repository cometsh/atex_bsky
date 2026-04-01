defmodule Chat.Bsky.Convo.GetLog do
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
              "logs" => %{
                "items" => %{
                  "refs" => [
                    "chat.bsky.convo.defs#logBeginConvo",
                    "chat.bsky.convo.defs#logAcceptConvo",
                    "chat.bsky.convo.defs#logLeaveConvo",
                    "chat.bsky.convo.defs#logMuteConvo",
                    "chat.bsky.convo.defs#logUnmuteConvo",
                    "chat.bsky.convo.defs#logCreateMessage",
                    "chat.bsky.convo.defs#logDeleteMessage",
                    "chat.bsky.convo.defs#logReadMessage",
                    "chat.bsky.convo.defs#logAddReaction",
                    "chat.bsky.convo.defs#logRemoveReaction"
                  ],
                  "type" => "union"
                },
                "type" => "array"
              }
            },
            "required" => ["logs"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{"cursor" => %{"type" => "string"}},
          "required" => [],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.convo.getLog",
    "lexicon" => 1
  })
end
