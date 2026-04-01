defmodule App.Bsky.Actor.Profile do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "A declaration of a Bluesky account profile.",
        "key" => "literal:self",
        "record" => %{
          "properties" => %{
            "avatar" => %{
              "accept" => ["image/png", "image/jpeg"],
              "description" =>
                "Small image to be displayed next to posts from account. AKA, 'profile picture'",
              "maxSize" => 1_000_000,
              "type" => "blob"
            },
            "banner" => %{
              "accept" => ["image/png", "image/jpeg"],
              "description" => "Larger horizontal image to display behind profile view.",
              "maxSize" => 1_000_000,
              "type" => "blob"
            },
            "createdAt" => %{"format" => "datetime", "type" => "string"},
            "description" => %{
              "description" => "Free-form profile description text.",
              "maxGraphemes" => 256,
              "maxLength" => 2560,
              "type" => "string"
            },
            "displayName" => %{
              "maxGraphemes" => 64,
              "maxLength" => 640,
              "type" => "string"
            },
            "joinedViaStarterPack" => %{
              "ref" => "com.atproto.repo.strongRef",
              "type" => "ref"
            },
            "labels" => %{
              "description" =>
                "Self-label values, specific to the Bluesky application, on the overall account.",
              "refs" => ["com.atproto.label.defs#selfLabels"],
              "type" => "union"
            },
            "pinnedPost" => %{
              "ref" => "com.atproto.repo.strongRef",
              "type" => "ref"
            },
            "pronouns" => %{
              "description" => "Free-form pronouns text.",
              "maxGraphemes" => 20,
              "maxLength" => 200,
              "type" => "string"
            },
            "website" => %{"format" => "uri", "type" => "string"}
          },
          "type" => "object"
        },
        "type" => "record"
      }
    },
    "id" => "app.bsky.actor.profile",
    "lexicon" => 1
  })
end
