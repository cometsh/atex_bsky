defmodule App.Bsky.Unspecced.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "ageAssuranceEvent" => %{
        "description" => "Object used to store age assurance data in stash.",
        "properties" => %{
          "attemptId" => %{
            "description" =>
              "The unique identifier for this instance of the age assurance flow, in UUID format.",
            "type" => "string"
          },
          "completeIp" => %{
            "description" => "The IP address used when completing the AA flow.",
            "type" => "string"
          },
          "completeUa" => %{
            "description" => "The user agent used when completing the AA flow.",
            "type" => "string"
          },
          "createdAt" => %{
            "description" => "The date and time of this write operation.",
            "format" => "datetime",
            "type" => "string"
          },
          "email" => %{
            "description" => "The email used for AA.",
            "type" => "string"
          },
          "initIp" => %{
            "description" => "The IP address used when initiating the AA flow.",
            "type" => "string"
          },
          "initUa" => %{
            "description" => "The user agent used when initiating the AA flow.",
            "type" => "string"
          },
          "status" => %{
            "description" => "The status of the age assurance process.",
            "knownValues" => ["unknown", "pending", "assured"],
            "type" => "string"
          }
        },
        "required" => ["createdAt", "status", "attemptId"],
        "type" => "object"
      },
      "ageAssuranceState" => %{
        "description" =>
          "The computed state of the age assurance process, returned to the user in question on certain authenticated requests.",
        "properties" => %{
          "lastInitiatedAt" => %{
            "description" => "The timestamp when this state was last updated.",
            "format" => "datetime",
            "type" => "string"
          },
          "status" => %{
            "description" => "The status of the age assurance process.",
            "knownValues" => ["unknown", "pending", "assured", "blocked"],
            "type" => "string"
          }
        },
        "required" => ["status"],
        "type" => "object"
      },
      "skeletonSearchActor" => %{
        "properties" => %{"did" => %{"format" => "did", "type" => "string"}},
        "required" => ["did"],
        "type" => "object"
      },
      "skeletonSearchPost" => %{
        "properties" => %{"uri" => %{"format" => "at-uri", "type" => "string"}},
        "required" => ["uri"],
        "type" => "object"
      },
      "skeletonSearchStarterPack" => %{
        "properties" => %{"uri" => %{"format" => "at-uri", "type" => "string"}},
        "required" => ["uri"],
        "type" => "object"
      },
      "skeletonTrend" => %{
        "properties" => %{
          "category" => %{"type" => "string"},
          "dids" => %{
            "items" => %{"format" => "did", "type" => "string"},
            "type" => "array"
          },
          "displayName" => %{"type" => "string"},
          "link" => %{"type" => "string"},
          "postCount" => %{"type" => "integer"},
          "startedAt" => %{"format" => "datetime", "type" => "string"},
          "status" => %{"knownValues" => ["hot"], "type" => "string"},
          "topic" => %{"type" => "string"}
        },
        "required" => ["topic", "displayName", "link", "startedAt", "postCount", "dids"],
        "type" => "object"
      },
      "threadItemBlocked" => %{
        "properties" => %{
          "author" => %{
            "ref" => "app.bsky.feed.defs#blockedAuthor",
            "type" => "ref"
          }
        },
        "required" => ["author"],
        "type" => "object"
      },
      "threadItemNoUnauthenticated" => %{"properties" => %{}, "type" => "object"},
      "threadItemNotFound" => %{"properties" => %{}, "type" => "object"},
      "threadItemPost" => %{
        "properties" => %{
          "hiddenByThreadgate" => %{
            "description" =>
              "The threadgate created by the author indicates this post as a reply to be hidden for everyone consuming the thread.",
            "type" => "boolean"
          },
          "moreParents" => %{
            "description" =>
              "This post has more parents that were not present in the response. This is just a boolean, without the number of parents.",
            "type" => "boolean"
          },
          "moreReplies" => %{
            "description" =>
              "This post has more replies that were not present in the response. This is a numeric value, which is best-effort and might not be accurate.",
            "type" => "integer"
          },
          "mutedByViewer" => %{
            "description" => "This is by an account muted by the viewer requesting it.",
            "type" => "boolean"
          },
          "opThread" => %{
            "description" =>
              "This post is part of a contiguous thread by the OP from the thread root. Many different OP threads can happen in the same thread.",
            "type" => "boolean"
          },
          "post" => %{"ref" => "app.bsky.feed.defs#postView", "type" => "ref"}
        },
        "required" => [
          "post",
          "moreParents",
          "moreReplies",
          "opThread",
          "hiddenByThreadgate",
          "mutedByViewer"
        ],
        "type" => "object"
      },
      "trendView" => %{
        "properties" => %{
          "actors" => %{
            "items" => %{
              "ref" => "app.bsky.actor.defs#profileViewBasic",
              "type" => "ref"
            },
            "type" => "array"
          },
          "category" => %{"type" => "string"},
          "displayName" => %{"type" => "string"},
          "link" => %{"type" => "string"},
          "postCount" => %{"type" => "integer"},
          "startedAt" => %{"format" => "datetime", "type" => "string"},
          "status" => %{"knownValues" => ["hot"], "type" => "string"},
          "topic" => %{"type" => "string"}
        },
        "required" => ["topic", "displayName", "link", "startedAt", "postCount", "actors"],
        "type" => "object"
      },
      "trendingTopic" => %{
        "properties" => %{
          "description" => %{"type" => "string"},
          "displayName" => %{"type" => "string"},
          "link" => %{"type" => "string"},
          "topic" => %{"type" => "string"}
        },
        "required" => ["topic", "link"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.unspecced.defs",
    "lexicon" => 1
  })
end
