defmodule App.Bsky.Unspecced.GetTrendingTopics do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of trending topics",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "suggested" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#trendingTopic",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "topics" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#trendingTopic",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["topics", "suggested"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "limit" => %{
              "default" => 10,
              "maximum" => 25,
              "minimum" => 1,
              "type" => "integer"
            },
            "viewer" => %{
              "description" =>
                "DID of the account making the request (not included for public/unauthenticated queries). Used to boost followed accounts in ranking.",
              "format" => "did",
              "type" => "string"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getTrendingTopics",
    "lexicon" => 1
  })
end
