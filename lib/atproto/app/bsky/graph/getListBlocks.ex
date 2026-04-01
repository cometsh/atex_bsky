defmodule App.Bsky.Graph.GetListBlocks do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get mod lists that the requesting account (actor) is blocking. Requires auth.",
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
    "id" => "app.bsky.graph.getListBlocks",
    "lexicon" => 1
  })
end
