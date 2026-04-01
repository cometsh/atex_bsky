defmodule App.Bsky.Notification.GetUnreadCount do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Count the number of unread notifications for the requesting account. Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{"count" => %{"type" => "integer"}},
            "required" => ["count"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "priority" => %{"type" => "boolean"},
            "seenAt" => %{"format" => "datetime", "type" => "string"}
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.notification.getUnreadCount",
    "lexicon" => 1
  })
end
