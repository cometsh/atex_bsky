defmodule App.Bsky.Unspecced.GetTrendsSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get the skeleton of trends on the network. Intended to be called and then hydrated through app.bsky.unspecced.getTrends",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "trends" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#skeletonTrend",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["trends"],
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
                "DID of the account making the request (not included for public/unauthenticated queries).",
              "format" => "did",
              "type" => "string"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getTrendsSkeleton",
    "lexicon" => 1
  })
end
