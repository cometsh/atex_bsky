defmodule App.Bsky.Notification.UpdateSeen do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Notify server that the requesting account has seen notifications. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "seenAt" => %{"format" => "datetime", "type" => "string"}
            },
            "required" => ["seenAt"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.notification.updateSeen",
    "lexicon" => 1
  })
end
