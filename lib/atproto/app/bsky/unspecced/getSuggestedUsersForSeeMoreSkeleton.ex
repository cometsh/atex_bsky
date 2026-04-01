defmodule App.Bsky.Unspecced.GetSuggestedUsersForSeeMoreSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a skeleton of suggested users for the See More page. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedUsersForSeeMore",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "dids" => %{
                "items" => %{"format" => "did", "type" => "string"},
                "type" => "array"
              },
              "recIdStr" => %{
                "description" =>
                  "Snowflake for this recommendation, use when submitting recommendation events.",
                "type" => "string"
              }
            },
            "required" => ["dids"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "category" => %{
              "description" => "Category of users to get suggestions for.",
              "type" => "string"
            },
            "limit" => %{
              "default" => 25,
              "maximum" => 50,
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
    "id" => "app.bsky.unspecced.getSuggestedUsersForSeeMoreSkeleton",
    "lexicon" => 1
  })
end
