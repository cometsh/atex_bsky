defmodule App.Bsky.Graph.UnmuteActorList do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Unmutes the specified list of accounts. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "list" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["list"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.unmuteActorList",
    "lexicon" => 1
  })
end
