defmodule App.Bsky.Actor.GetPreferences do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get private preferences attached to the current account. Expected use is synchronization between multiple devices, and import/export during account migration. Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "preferences" => %{
                "ref" => "app.bsky.actor.defs#preferences",
                "type" => "ref"
              }
            },
            "required" => ["preferences"],
            "type" => "object"
          }
        },
        "parameters" => %{"properties" => %{}, "type" => "params"},
        "type" => "query"
      }
    },
    "id" => "app.bsky.actor.getPreferences",
    "lexicon" => 1
  })
end
