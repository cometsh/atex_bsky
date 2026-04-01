defmodule App.Bsky.Graph.GetSuggestedFollowsByActor do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Enumerates follows similar to a given account (actor). Expected use is to recommend additional accounts immediately after following one account.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "isFallback" => %{
                "default" => false,
                "description" =>
                  "DEPRECATED, unused. Previously: if true, response has fallen-back to generic results, and is not scoped using relativeToDid",
                "type" => "boolean"
              },
              "recId" => %{
                "description" => "DEPRECATED: use recIdStr instead.",
                "type" => "integer"
              },
              "recIdStr" => %{
                "description" =>
                  "Snowflake for this recommendation, use when submitting recommendation events.",
                "type" => "string"
              },
              "suggestions" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["suggestions"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "actor" => %{"format" => "at-identifier", "type" => "string"}
          },
          "required" => ["actor"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getSuggestedFollowsByActor",
    "lexicon" => 1
  })
end
