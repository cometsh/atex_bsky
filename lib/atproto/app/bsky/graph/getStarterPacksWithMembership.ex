defmodule App.Bsky.Graph.GetStarterPacksWithMembership do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Enumerates the starter packs created by the session user, and includes membership information about `actor` in those starter packs. Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "starterPacksWithMembership" => %{
                "items" => %{
                  "ref" => "#starterPackWithMembership",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["starterPacksWithMembership"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "actor" => %{
              "description" => "The account (actor) to check for membership.",
              "format" => "at-identifier",
              "type" => "string"
            },
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "required" => ["actor"],
          "type" => "params"
        },
        "type" => "query"
      },
      "starterPackWithMembership" => %{
        "description" =>
          "A starter pack and an optional list item indicating membership of a target user to that starter pack.",
        "properties" => %{
          "listItem" => %{
            "ref" => "app.bsky.graph.defs#listItemView",
            "type" => "ref"
          },
          "starterPack" => %{
            "ref" => "app.bsky.graph.defs#starterPackView",
            "type" => "ref"
          }
        },
        "required" => ["starterPack"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.graph.getStarterPacksWithMembership",
    "lexicon" => 1
  })
end
