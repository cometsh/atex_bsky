defmodule App.Bsky.Graph.UnmuteActor do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Unmutes the specified account. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actor" => %{"format" => "at-identifier", "type" => "string"}
            },
            "required" => ["actor"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.unmuteActor",
    "lexicon" => 1
  })
end
