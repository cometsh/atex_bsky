defmodule App.Bsky.Unspecced.GetSuggestedFeeds do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of suggested feeds",
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
    "id" => "app.bsky.unspecced.getSuggestedFeeds",
    "lexicon" => 1
  })
end
