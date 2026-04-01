defmodule App.Bsky.Unspecced.GetSuggestedUsers do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of suggested users",
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
            "required" => ["actors"],
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
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getSuggestedUsers",
    "lexicon" => 1
  })
end
