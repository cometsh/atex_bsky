defmodule App.Bsky.Unspecced.GetSuggestedUsersSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a skeleton of suggested users. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedUsers",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "dids" => %{
                "items" => %{"format" => "did", "type" => "string"},
                "type" => "array"
              },
              "recId" => %{
                "description" => "DEPRECATED: use recIdStr instead.",
                "type" => "string"
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
    "id" => "app.bsky.unspecced.getSuggestedUsersSkeleton",
    "lexicon" => 1
  })
end
