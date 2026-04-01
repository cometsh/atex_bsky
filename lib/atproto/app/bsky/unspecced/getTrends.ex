defmodule App.Bsky.Unspecced.GetTrends do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get the current trends on the network",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "trends" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#trendView",
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
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getTrends",
    "lexicon" => 1
  })
end
