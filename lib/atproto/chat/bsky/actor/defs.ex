defmodule Chat.Bsky.Actor.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "profileViewBasic" => %{
        "properties" => %{
          "associated" => %{
            "ref" => "app.bsky.actor.defs#profileAssociated",
            "type" => "ref"
          },
          "avatar" => %{"format" => "uri", "type" => "string"},
          "chatDisabled" => %{
            "description" =>
              "Set to true when the actor cannot actively participate in conversations",
            "type" => "boolean"
          },
          "did" => %{"format" => "did", "type" => "string"},
          "displayName" => %{
            "maxGraphemes" => 64,
            "maxLength" => 640,
            "type" => "string"
          },
          "handle" => %{"format" => "handle", "type" => "string"},
          "labels" => %{
            "items" => %{"ref" => "com.atproto.label.defs#label", "type" => "ref"},
            "type" => "array"
          },
          "verification" => %{
            "ref" => "app.bsky.actor.defs#verificationState",
            "type" => "ref"
          },
          "viewer" => %{
            "ref" => "app.bsky.actor.defs#viewerState",
            "type" => "ref"
          }
        },
        "required" => ["did", "handle"],
        "type" => "object"
      }
    },
    "id" => "chat.bsky.actor.defs",
    "lexicon" => 1
  })
end
