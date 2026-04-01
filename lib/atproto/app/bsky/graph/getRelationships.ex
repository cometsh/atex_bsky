defmodule App.Bsky.Graph.GetRelationships do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Enumerates public relationships between one account, and a list of other accounts. Does not require auth.",
        "errors" => [
          %{
            "description" => "the primary actor at-identifier could not be resolved",
            "name" => "ActorNotFound"
          }
        ],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actor" => %{"format" => "did", "type" => "string"},
              "relationships" => %{
                "items" => %{
                  "refs" => [
                    "app.bsky.graph.defs#relationship",
                    "app.bsky.graph.defs#notFoundActor"
                  ],
                  "type" => "union"
                },
                "type" => "array"
              }
            },
            "required" => ["relationships"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "actor" => %{
              "description" => "Primary account requesting relationships for.",
              "format" => "at-identifier",
              "type" => "string"
            },
            "others" => %{
              "description" => "List of 'other' accounts to be related back to the primary.",
              "items" => %{"format" => "at-identifier", "type" => "string"},
              "maxLength" => 30,
              "type" => "array"
            }
          },
          "required" => ["actor"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.graph.getRelationships",
    "lexicon" => 1
  })
end
