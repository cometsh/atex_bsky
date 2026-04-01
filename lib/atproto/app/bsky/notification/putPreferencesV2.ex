defmodule App.Bsky.Notification.PutPreferencesV2 do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Set notification-related preferences for an account. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "chat" => %{
                "ref" => "app.bsky.notification.defs#chatPreference",
                "type" => "ref"
              },
              "follow" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "like" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "likeViaRepost" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "mention" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "quote" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "reply" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "repost" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "repostViaRepost" => %{
                "ref" => "app.bsky.notification.defs#filterablePreference",
                "type" => "ref"
              },
              "starterpackJoined" => %{
                "ref" => "app.bsky.notification.defs#preference",
                "type" => "ref"
              },
              "subscribedPost" => %{
                "ref" => "app.bsky.notification.defs#preference",
                "type" => "ref"
              },
              "unverified" => %{
                "ref" => "app.bsky.notification.defs#preference",
                "type" => "ref"
              },
              "verified" => %{
                "ref" => "app.bsky.notification.defs#preference",
                "type" => "ref"
              }
            },
            "type" => "object"
          }
        },
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
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.notification.putPreferencesV2",
    "lexicon" => 1
  })
end
