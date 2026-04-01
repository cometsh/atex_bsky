defmodule App.Bsky.Graph.GetFollows do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Enumerates accounts which a specified account (actor) follows.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "follows" => %{
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
            "required" => ["subject", "follows"],
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
    "id" => "app.bsky.graph.getFollows",
    "lexicon" => 1
  })
end
