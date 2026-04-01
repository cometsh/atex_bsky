defmodule App.Bsky.Graph.GetListMutes do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Enumerates mod lists that the requesting account (actor) currently has muted. Requires auth.",
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
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getListMutes",
    "lexicon" => 1
  })
end
