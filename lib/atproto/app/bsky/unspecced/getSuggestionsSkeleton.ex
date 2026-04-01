defmodule App.Bsky.Unspecced.GetSuggestionsSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a skeleton of suggested actors. Intended to be called and then hydrated through app.bsky.actor.getSuggestions",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actors" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#skeletonSearchActor",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "cursor" => %{"type" => "string"},
              "recId" => %{
                "description" => "DEPRECATED: use recIdStr instead.",
                "type" => "integer"
              },
              "recIdStr" => %{
                "description" =>
                  "Snowflake for this recommendation, use when submitting recommendation events.",
                "type" => "string"
              },
              "relativeToDid" => %{
                "description" =>
                  "DID of the account these suggestions are relative to. If this is returned undefined, suggestions are based on the viewer.",
                "format" => "did",
                "type" => "string"
              }
            },
            "required" => ["actors"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "relativeToDid" => %{
              "description" =>
                "DID of the account to get suggestions relative to. If not provided, suggestions will be based on the viewer.",
              "format" => "did",
              "type" => "string"
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
    "id" => "app.bsky.unspecced.getSuggestionsSkeleton",
    "lexicon" => 1
  })
end
