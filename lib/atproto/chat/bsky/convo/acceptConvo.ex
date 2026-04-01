defmodule Chat.Bsky.Convo.AcceptConvo do
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
              "rev" => %{
                "description" =>
                  "Rev when the convo was accepted. If not present, the convo was already accepted.",
                "type" => "string"
              }
            },
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "chat.bsky.convo.acceptConvo",
    "lexicon" => 1
  })
end
