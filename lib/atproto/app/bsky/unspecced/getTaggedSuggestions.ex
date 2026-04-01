defmodule App.Bsky.Unspecced.GetTaggedSuggestions do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of suggestions (feeds and users) tagged with categories",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "suggestions" => %{
                "items" => %{"ref" => "#suggestion", "type" => "ref"},
                "type" => "array"
              }
            },
            "required" => ["suggestions"],
            "type" => "object"
          }
        },
        "parameters" => %{"properties" => %{}, "type" => "params"},
        "type" => "query"
      },
      "suggestion" => %{
        "properties" => %{
          "subject" => %{"format" => "uri", "type" => "string"},
          "subjectType" => %{
            "knownValues" => ["actor", "feed"],
            "type" => "string"
          },
          "tag" => %{"type" => "string"}
        },
        "required" => ["tag", "subjectType", "subject"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.unspecced.getTaggedSuggestions",
    "lexicon" => 1
  })
end
