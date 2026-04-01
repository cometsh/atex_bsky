defmodule App.Bsky.Unspecced.GetPopularFeedGenerators do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "An unspecced view of globally popular feed generators.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "feeds" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#generatorView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["feeds"],
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
            },
            "query" => %{"type" => "string"}
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getPopularFeedGenerators",
    "lexicon" => 1
  })
end
