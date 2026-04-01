defmodule App.Bsky.Feed.GetTimeline do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a view of the requesting account's home timeline. This is expected to be some form of reverse-chronological feed.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "feed" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#feedViewPost",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["feed"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "algorithm" => %{
              "description" =>
                "Variant 'algorithm' for timeline. Implementation-specific. NOTE: most feed flexibility has been moved to feed generator mechanism.",
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
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getTimeline",
    "lexicon" => 1
  })
end
