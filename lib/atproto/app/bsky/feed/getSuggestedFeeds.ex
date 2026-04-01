defmodule App.Bsky.Feed.GetSuggestedFeeds do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a list of suggested feeds (feed generators) for the requesting account.",
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
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getSuggestedFeeds",
    "lexicon" => 1
  })
end
