defmodule App.Bsky.Notification.PutActivitySubscription do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Puts an activity subscription entry. The key should be omitted for creation and provided for updates. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "activitySubscription" => %{
                "ref" => "app.bsky.notification.defs#activitySubscription",
                "type" => "ref"
              },
              "subject" => %{"format" => "did", "type" => "string"}
            },
            "required" => ["subject", "activitySubscription"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "activitySubscription" => %{
                "ref" => "app.bsky.notification.defs#activitySubscription",
                "type" => "ref"
              },
              "subject" => %{"format" => "did", "type" => "string"}
            },
            "required" => ["subject"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.notification.putActivitySubscription",
    "lexicon" => 1
  })
end
