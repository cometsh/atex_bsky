defmodule App.Bsky.Draft.CreateDraft do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Inserts a draft using private storage (stash). An upper limit of drafts might be enforced. Requires authentication.",
        "errors" => [
          %{
            "description" => "Trying to insert a new draft when the limit was already reached.",
            "name" => "DraftLimitReached"
          }
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "draft" => %{"ref" => "app.bsky.draft.defs#draft", "type" => "ref"}
            },
            "required" => ["draft"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "id" => %{
                "description" => "The ID of the created draft.",
                "type" => "string"
              }
            },
            "required" => ["id"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.draft.createDraft",
    "lexicon" => 1
  })
end
