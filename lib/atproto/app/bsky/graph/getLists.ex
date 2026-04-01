defmodule App.Bsky.Graph.GetLists do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Enumerates the lists created by a specified account (actor).",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "lists" => %{
                "items" => %{
                  "ref" => "app.bsky.graph.defs#listView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["lists"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "actor" => %{
              "description" => "The account (actor) to enumerate lists from.",
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
    "id" => "app.bsky.graph.getLists",
    "lexicon" => 1
  })
end
