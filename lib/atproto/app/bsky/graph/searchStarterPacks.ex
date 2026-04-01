defmodule App.Bsky.Graph.SearchStarterPacks do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Find starter packs matching search criteria. Does not require auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
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
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 25,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "q" => %{
              "description" =>
                "Search query string. Syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.",
              "type" => "string"
            }
          },
          "required" => ["q"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.searchStarterPacks",
    "lexicon" => 1
  })
end
