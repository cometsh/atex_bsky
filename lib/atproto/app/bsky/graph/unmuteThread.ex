defmodule App.Bsky.Graph.UnmuteThread do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Unmutes the specified thread. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "root" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["root"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.unmuteThread",
    "lexicon" => 1
  })
end
