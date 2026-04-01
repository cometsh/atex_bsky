defmodule App.Bsky.Draft.DeleteDraft do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Deletes a draft by ID. Requires authentication.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{"id" => %{"format" => "tid", "type" => "string"}},
            "required" => ["id"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.draft.deleteDraft",
    "lexicon" => 1
  })
end
