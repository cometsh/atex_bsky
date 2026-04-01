defmodule App.Bsky.Graph.GetListsWithMembership do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "listWithMembership" => %{
        "description" =>
          "A list and an optional list item indicating membership of a target user to that list.",
        "properties" => %{
          "list" => %{"ref" => "app.bsky.graph.defs#listView", "type" => "ref"},
          "listItem" => %{
            "ref" => "app.bsky.graph.defs#listItemView",
            "type" => "ref"
          }
        },
        "required" => ["list"],
        "type" => "object"
      },
      "main" => %{
        "description" =>
          "Enumerates the lists created by the session user, and includes membership information about `actor` in those lists. Only supports curation and moderation lists (no reference lists, used in starter packs). Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "listsWithMembership" => %{
                "items" => %{"ref" => "#listWithMembership", "type" => "ref"},
                "type" => "array"
              }
            },
            "required" => ["listsWithMembership"],
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
            },
            "purposes" => %{
              "description" =>
                "Optional filter by list purpose. If not specified, all supported types are returned.",
              "items" => %{
                "knownValues" => ["modlist", "curatelist"],
                "type" => "string"
              },
              "type" => "array"
            }
          },
          "required" => ["actor"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getListsWithMembership",
    "lexicon" => 1
  })
end
