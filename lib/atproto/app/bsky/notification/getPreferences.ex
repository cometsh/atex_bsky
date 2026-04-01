defmodule App.Bsky.Notification.GetPreferences do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get notification-related preferences for an account. Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "preferences" => %{
                "ref" => "app.bsky.notification.defs#preferences",
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
    "id" => "app.bsky.notification.getPreferences",
    "lexicon" => 1
  })
end
