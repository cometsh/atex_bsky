defmodule App.Bsky.Feed.GetFeedGenerators do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get information about a list of feed generators.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
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
            "feeds" => %{
              "items" => %{"format" => "at-uri", "type" => "string"},
              "type" => "array"
            }
          },
          "required" => ["feeds"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getFeedGenerators",
    "lexicon" => 1
  })
end
