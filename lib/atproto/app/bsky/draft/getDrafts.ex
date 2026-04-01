defmodule App.Bsky.Draft.GetDrafts do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Gets views of user drafts. Requires authentication.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "drafts" => %{
                "items" => %{
                  "ref" => "app.bsky.draft.defs#draftView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["drafts"],
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
    "id" => "app.bsky.draft.getDrafts",
    "lexicon" => 1
  })
end
