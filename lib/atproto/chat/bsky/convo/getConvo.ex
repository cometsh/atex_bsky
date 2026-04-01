defmodule Chat.Bsky.Convo.GetConvo do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
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
        "parameters" => %{
          "properties" => %{"convoId" => %{"type" => "string"}},
          "required" => ["convoId"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "chat.bsky.convo.getConvo",
    "lexicon" => 1
  })
end
