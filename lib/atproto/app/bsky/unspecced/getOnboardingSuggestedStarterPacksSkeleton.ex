defmodule App.Bsky.Unspecced.GetOnboardingSuggestedStarterPacksSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a skeleton of suggested starterpacks for onboarding. Intended to be called and hydrated by app.bsky.unspecced.getOnboardingSuggestedStarterPacks",
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
    "id" => "app.bsky.unspecced.getOnboardingSuggestedStarterPacksSkeleton",
    "lexicon" => 1
  })
end
