defmodule App.Bsky.Contact.GetSyncStatus do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Gets the user's current contact import status. Requires authentication.",
        "errors" => [%{"name" => "InvalidDid"}, %{"name" => "InternalError"}],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "syncStatus" => %{
                "description" =>
                  "If present, indicates the user has imported their contacts. If not present, indicates the user never used the feature or called `app.bsky.contact.removeData` and didn't import again since.",
                "ref" => "app.bsky.contact.defs#syncStatus",
                "type" => "ref"
              }
            },
            "type" => "object"
          }
        },
        "parameters" => %{"properties" => %{}, "type" => "params"},
        "type" => "query"
      }
    },
    "id" => "app.bsky.contact.getSyncStatus",
    "lexicon" => 1
  })
end
