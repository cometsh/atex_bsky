defmodule App.Bsky.Notification.PutPreferences do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Set notification-related preferences for an account. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{"priority" => %{"type" => "boolean"}},
            "required" => ["priority"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.notification.putPreferences",
    "lexicon" => 1
  })
end
