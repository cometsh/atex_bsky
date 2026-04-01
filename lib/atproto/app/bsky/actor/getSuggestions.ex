defmodule App.Bsky.Actor.GetSuggestions do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a list of suggested actors. Expected use is discovery of accounts to follow during new account onboarding.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actors" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileView",
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
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.actor.getSuggestions",
    "lexicon" => 1
  })
end
