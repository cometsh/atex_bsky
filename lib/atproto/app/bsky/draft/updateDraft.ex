defmodule App.Bsky.Draft.UpdateDraft do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Updates a draft using private storage (stash). If the draft ID points to a non-existing ID, the update will be silently ignored. This is done because updates don't enforce draft limit, so it accepts all writes, but will ignore invalid ones. Requires authentication.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "draft" => %{
                "ref" => "app.bsky.draft.defs#draftWithId",
                "type" => "ref"
              }
            },
            "required" => ["draft"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.draft.updateDraft",
    "lexicon" => 1
  })
end
