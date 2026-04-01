defmodule App.Bsky.Labeler.GetServices do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get information about a list of labeler services.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "views" => %{
                "items" => %{
                  "refs" => [
                    "app.bsky.labeler.defs#labelerView",
                    "app.bsky.labeler.defs#labelerViewDetailed"
                  ],
                  "type" => "union"
                },
                "type" => "array"
              }
            },
            "required" => ["views"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "detailed" => %{"default" => false, "type" => "boolean"},
            "dids" => %{
              "items" => %{"format" => "did", "type" => "string"},
              "type" => "array"
            }
          },
          "required" => ["dids"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.labeler.getServices",
    "lexicon" => 1
  })
end
