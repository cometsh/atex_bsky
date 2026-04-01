defmodule App.Bsky.Embed.Record do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "properties" => %{
          "record" => %{"ref" => "com.atproto.repo.strongRef", "type" => "ref"}
        },
        "required" => ["record"],
        "type" => "object"
      },
      "view" => %{
        "properties" => %{
          "record" => %{
            "refs" => [
              "#viewRecord",
              "#viewNotFound",
              "#viewBlocked",
              "#viewDetached",
              "app.bsky.feed.defs#generatorView",
              "app.bsky.graph.defs#listView",
              "app.bsky.labeler.defs#labelerView",
              "app.bsky.graph.defs#starterPackViewBasic"
            ],
            "type" => "union"
          }
        },
        "required" => ["record"],
        "type" => "object"
      },
      "viewBlocked" => %{
        "properties" => %{
          "author" => %{
            "ref" => "app.bsky.feed.defs#blockedAuthor",
            "type" => "ref"
          },
          "blocked" => %{"const" => true, "type" => "boolean"},
          "uri" => %{"format" => "at-uri", "type" => "string"}
        },
        "required" => ["uri", "blocked", "author"],
        "type" => "object"
      },
      "viewDetached" => %{
        "properties" => %{
          "detached" => %{"const" => true, "type" => "boolean"},
          "uri" => %{"format" => "at-uri", "type" => "string"}
        },
        "required" => ["uri", "detached"],
        "type" => "object"
      },
      "viewNotFound" => %{
        "properties" => %{
          "notFound" => %{"const" => true, "type" => "boolean"},
          "uri" => %{"format" => "at-uri", "type" => "string"}
        },
        "required" => ["uri", "notFound"],
        "type" => "object"
      },
      "viewRecord" => %{
        "properties" => %{
          "author" => %{
            "ref" => "app.bsky.actor.defs#profileViewBasic",
            "type" => "ref"
          },
          "cid" => %{"format" => "cid", "type" => "string"},
          "embeds" => %{
            "items" => %{
              "refs" => [
                "app.bsky.embed.images#view",
                "app.bsky.embed.video#view",
                "app.bsky.embed.external#view",
                "app.bsky.embed.record#view",
                "app.bsky.embed.recordWithMedia#view"
              ],
              "type" => "union"
            },
            "type" => "array"
          },
          "indexedAt" => %{"format" => "datetime", "type" => "string"},
          "labels" => %{
            "items" => %{"ref" => "com.atproto.label.defs#label", "type" => "ref"},
            "type" => "array"
          },
          "likeCount" => %{"type" => "integer"},
          "quoteCount" => %{"type" => "integer"},
          "replyCount" => %{"type" => "integer"},
          "repostCount" => %{"type" => "integer"},
          "uri" => %{"format" => "at-uri", "type" => "string"},
          "value" => %{
            "description" => "The record data itself.",
            "type" => "unknown"
          }
        },
        "required" => ["uri", "cid", "author", "value", "indexedAt"],
        "type" => "object"
      }
    },
    "description" =>
      "A representation of a record embedded in a Bluesky record (eg, a post). For example, a quote-post, or sharing a feed generator record.",
    "id" => "app.bsky.embed.record",
    "lexicon" => 1
  })
end
