defmodule App.Bsky.Graph.GetFollowers do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Enumerates accounts which follow a specified account (actor).",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "followers" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileView",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "subject" => %{
                "ref" => "app.bsky.actor.defs#profileView",
                "type" => "ref"
              }
            },
            "required" => ["subject", "followers"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "actor" => %{"format" => "at-identifier", "type" => "string"},
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
      }
    },
    "id" => "app.bsky.graph.getFollowers",
    "lexicon" => 1
  })
end
