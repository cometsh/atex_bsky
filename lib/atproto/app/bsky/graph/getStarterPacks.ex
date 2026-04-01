defmodule App.Bsky.Graph.GetStarterPacks do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get views for a list of starter packs.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "starterPacks" => %{
                "items" => %{
                  "ref" => "app.bsky.graph.defs#starterPackViewBasic",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["starterPacks"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "uris" => %{
              "items" => %{"format" => "at-uri", "type" => "string"},
              "maxLength" => 25,
              "type" => "array"
            }
          },
          "required" => ["uris"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getStarterPacks",
    "lexicon" => 1
  })
end
