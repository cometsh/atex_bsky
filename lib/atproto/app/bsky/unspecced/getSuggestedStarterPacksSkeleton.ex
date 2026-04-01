defmodule App.Bsky.Unspecced.GetSuggestedStarterPacksSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a skeleton of suggested starterpacks. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedStarterpacks",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "starterPacks" => %{
                "items" => %{"format" => "at-uri", "type" => "string"},
                "type" => "array"
              }
            },
            "required" => ["starterPacks"],
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
    "id" => "app.bsky.unspecced.getSuggestedStarterPacksSkeleton",
    "lexicon" => 1
  })
end
