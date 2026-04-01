defmodule App.Bsky.Draft.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "draft" => %{
        "description" => "A draft containing an array of draft posts.",
        "properties" => %{
          "deviceId" => %{
            "description" => "UUIDv4 identifier of the device that created this draft.",
            "maxLength" => 100,
            "type" => "string"
          },
          "deviceName" => %{
            "description" => "The device and/or platform on which the draft was created.",
            "maxLength" => 100,
            "type" => "string"
          },
          "langs" => %{
            "description" => "Indicates human language of posts primary text content.",
            "items" => %{"format" => "language", "type" => "string"},
            "maxLength" => 3,
            "type" => "array"
          },
          "postgateEmbeddingRules" => %{
            "description" =>
              "Embedding rules for the postgates to be created when this draft is published.",
            "items" => %{
              "refs" => ["app.bsky.feed.postgate#disableRule"],
              "type" => "union"
            },
            "maxLength" => 5,
            "type" => "array"
          },
          "posts" => %{
            "description" => "Array of draft posts that compose this draft.",
            "items" => %{"ref" => "#draftPost", "type" => "ref"},
            "maxLength" => 100,
            "minLength" => 1,
            "type" => "array"
          },
          "threadgateAllow" => %{
            "description" =>
              "Allow-rules for the threadgate to be created when this draft is published.",
            "items" => %{
              "refs" => [
                "app.bsky.feed.threadgate#mentionRule",
                "app.bsky.feed.threadgate#followerRule",
                "app.bsky.feed.threadgate#followingRule",
                "app.bsky.feed.threadgate#listRule"
              ],
              "type" => "union"
            },
            "maxLength" => 5,
            "type" => "array"
          }
        },
        "required" => ["posts"],
        "type" => "object"
      },
      "draftEmbedCaption" => %{
        "properties" => %{
          "content" => %{"maxLength" => 10000, "type" => "string"},
          "lang" => %{"format" => "language", "type" => "string"}
        },
        "required" => ["lang", "content"],
        "type" => "object"
      },
      "draftEmbedExternal" => %{
        "properties" => %{"uri" => %{"format" => "uri", "type" => "string"}},
        "required" => ["uri"],
        "type" => "object"
      },
      "draftEmbedImage" => %{
        "properties" => %{
          "alt" => %{"maxGraphemes" => 2000, "type" => "string"},
          "localRef" => %{"ref" => "#draftEmbedLocalRef", "type" => "ref"}
        },
        "required" => ["localRef"],
        "type" => "object"
      },
      "draftEmbedLocalRef" => %{
        "properties" => %{
          "path" => %{
            "description" =>
              "Local, on-device ref to file to be embedded. Embeds are currently device-bound for drafts.",
            "maxLength" => 1024,
            "minLength" => 1,
            "type" => "string"
          }
        },
        "required" => ["path"],
        "type" => "object"
      },
      "draftEmbedRecord" => %{
        "properties" => %{
          "record" => %{"ref" => "com.atproto.repo.strongRef", "type" => "ref"}
        },
        "required" => ["record"],
        "type" => "object"
      },
      "draftEmbedVideo" => %{
        "properties" => %{
          "alt" => %{"maxGraphemes" => 2000, "type" => "string"},
          "captions" => %{
            "items" => %{"ref" => "#draftEmbedCaption", "type" => "ref"},
            "maxLength" => 20,
            "type" => "array"
          },
          "localRef" => %{"ref" => "#draftEmbedLocalRef", "type" => "ref"}
        },
        "required" => ["localRef"],
        "type" => "object"
      },
      "draftPost" => %{
        "description" => "One of the posts that compose a draft.",
        "properties" => %{
          "embedExternals" => %{
            "items" => %{"ref" => "#draftEmbedExternal", "type" => "ref"},
            "maxLength" => 1,
            "type" => "array"
          },
          "embedImages" => %{
            "items" => %{"ref" => "#draftEmbedImage", "type" => "ref"},
            "maxLength" => 4,
            "type" => "array"
          },
          "embedRecords" => %{
            "items" => %{"ref" => "#draftEmbedRecord", "type" => "ref"},
            "maxLength" => 1,
            "type" => "array"
          },
          "embedVideos" => %{
            "items" => %{"ref" => "#draftEmbedVideo", "type" => "ref"},
            "maxLength" => 1,
            "type" => "array"
          },
          "labels" => %{
            "description" => "Self-label values for this post. Effectively content warnings.",
            "refs" => ["com.atproto.label.defs#selfLabels"],
            "type" => "union"
          },
          "text" => %{
            "description" =>
              "The primary post content. It has a higher limit than post contents to allow storing a larger text that can later be refined into smaller posts.",
            "maxGraphemes" => 1000,
            "maxLength" => 10000,
            "type" => "string"
          }
        },
        "required" => ["text"],
        "type" => "object"
      },
      "draftView" => %{
        "description" => "View to present drafts data to users.",
        "properties" => %{
          "createdAt" => %{
            "description" => "The time the draft was created.",
            "format" => "datetime",
            "type" => "string"
          },
          "draft" => %{"ref" => "#draft", "type" => "ref"},
          "id" => %{
            "description" => "A TID to be used as a draft identifier.",
            "format" => "tid",
            "type" => "string"
          },
          "updatedAt" => %{
            "description" => "The time the draft was last updated.",
            "format" => "datetime",
            "type" => "string"
          }
        },
        "required" => ["id", "draft", "createdAt", "updatedAt"],
        "type" => "object"
      },
      "draftWithId" => %{
        "description" =>
          "A draft with an identifier, used to store drafts in private storage (stash).",
        "properties" => %{
          "draft" => %{"ref" => "#draft", "type" => "ref"},
          "id" => %{
            "description" => "A TID to be used as a draft identifier.",
            "format" => "tid",
            "type" => "string"
          }
        },
        "required" => ["id", "draft"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.draft.defs",
    "lexicon" => 1
  })
end
