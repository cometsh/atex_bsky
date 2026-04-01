defmodule App.Bsky.Feed.GetActorFeeds do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a list of feeds (feed generator records) created by the actor (in the actor's repo).",
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
    "id" => "app.bsky.feed.getActorFeeds",
    "lexicon" => 1
  })
end
