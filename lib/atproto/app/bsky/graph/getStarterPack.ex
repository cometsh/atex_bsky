defmodule App.Bsky.Graph.GetStarterPack do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Gets a view of a starter pack.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "starterPack" => %{
                "ref" => "app.bsky.graph.defs#starterPackView",
                "type" => "ref"
              }
            },
            "required" => ["starterPack"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "starterPack" => %{
              "description" => "Reference (AT-URI) of the starter pack record.",
              "format" => "at-uri",
              "type" => "string"
            }
          },
          "required" => ["starterPack"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getStarterPack",
    "lexicon" => 1
  })
end
