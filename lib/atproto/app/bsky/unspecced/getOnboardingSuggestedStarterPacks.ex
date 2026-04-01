defmodule App.Bsky.Unspecced.GetOnboardingSuggestedStarterPacks do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of suggested starterpacks for onboarding",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "starterPacks" => %{
                "items" => %{
                  "ref" => "app.bsky.graph.defs#starterPackView",
                  "type" => "ref"
                },
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
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getOnboardingSuggestedStarterPacks",
    "lexicon" => 1
  })
end
