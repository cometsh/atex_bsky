defmodule Chat.Bsky.Convo.LeaveConvo do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{"convoId" => %{"type" => "string"}},
            "required" => ["convoId"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "convoId" => %{"type" => "string"},
              "rev" => %{"type" => "string"}
            },
            "required" => ["convoId", "rev"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.leaveConvo",
    "lexicon" => 1
  })
end
