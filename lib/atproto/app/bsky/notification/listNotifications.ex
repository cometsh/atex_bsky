defmodule App.Bsky.Notification.ListNotifications do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Enumerate notifications for the requesting account. Requires auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "notifications" => %{
                "items" => %{"ref" => "#notification", "type" => "ref"},
                "type" => "array"
              },
              "priority" => %{"type" => "boolean"},
              "seenAt" => %{"format" => "datetime", "type" => "string"}
            },
            "required" => ["notifications"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "priority" => %{"type" => "boolean"},
            "reasons" => %{
              "description" => "Notification reasons to include in response.",
              "items" => %{
                "description" => "A reason that matches the reason property of #notification.",
                "type" => "string"
              },
              "type" => "array"
            },
            "seenAt" => %{"format" => "datetime", "type" => "string"}
          },
          "type" => "params"
        },
        "type" => "query"
      },
      "notification" => %{
        "properties" => %{
          "author" => %{
            "ref" => "app.bsky.actor.defs#profileView",
            "type" => "ref"
          },
          "cid" => %{"format" => "cid", "type" => "string"},
          "indexedAt" => %{"format" => "datetime", "type" => "string"},
          "isRead" => %{"type" => "boolean"},
          "labels" => %{
            "items" => %{"ref" => "com.atproto.label.defs#label", "type" => "ref"},
            "type" => "array"
          },
          "reason" => %{
            "description" =>
              "The reason why this notification was delivered - e.g. your post was liked, or you received a new follower.",
            "knownValues" => [
              "like",
              "repost",
              "follow",
              "mention",
              "reply",
              "quote",
              "starterpack-joined",
              "verified",
              "unverified",
              "like-via-repost",
              "repost-via-repost",
              "subscribed-post",
              "contact-match"
            ],
            "type" => "string"
          },
          "reasonSubject" => %{"format" => "at-uri", "type" => "string"},
          "record" => %{"type" => "unknown"},
          "uri" => %{"format" => "at-uri", "type" => "string"}
        },
        "required" => ["uri", "cid", "author", "reason", "record", "isRead", "indexedAt"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.notification.listNotifications",
    "lexicon" => 1
  })
end
