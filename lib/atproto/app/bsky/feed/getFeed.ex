defmodule App.Bsky.Feed.GetFeed do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a hydrated feed from an actor's selected feed generator. Implemented by App View.",
        "errors" => [%{"name" => "UnknownFeed"}],
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
            "cursor" => %{"type" => "string"},
            "feed" => %{"format" => "at-uri", "type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "required" => ["feed"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getFeed",
    "lexicon" => 1
  })
end
