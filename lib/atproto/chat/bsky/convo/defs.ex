defmodule Chat.Bsky.Convo.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "convoView" => %{
        "properties" => %{
          "id" => %{"type" => "string"},
          "lastMessage" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "lastReaction" => %{
            "refs" => ["#messageAndReactionView"],
            "type" => "union"
          },
          "members" => %{
            "items" => %{
              "ref" => "chat.bsky.actor.defs#profileViewBasic",
              "type" => "ref"
            },
            "type" => "array"
          },
          "muted" => %{"type" => "boolean"},
          "rev" => %{"type" => "string"},
          "status" => %{
            "knownValues" => ["request", "accepted"],
            "type" => "string"
          },
          "unreadCount" => %{"type" => "integer"}
        },
        "required" => ["id", "rev", "members", "muted", "unreadCount"],
        "type" => "object"
      },
      "deletedMessageView" => %{
        "properties" => %{
          "id" => %{"type" => "string"},
          "rev" => %{"type" => "string"},
          "sender" => %{"ref" => "#messageViewSender", "type" => "ref"},
          "sentAt" => %{"format" => "datetime", "type" => "string"}
        },
        "required" => ["id", "rev", "sender", "sentAt"],
        "type" => "object"
      },
      "logAcceptConvo" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId"],
        "type" => "object"
      },
      "logAddReaction" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "reaction" => %{"ref" => "#reactionView", "type" => "ref"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId", "message", "reaction"],
        "type" => "object"
      },
      "logBeginConvo" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId"],
        "type" => "object"
      },
      "logCreateMessage" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId", "message"],
        "type" => "object"
      },
      "logDeleteMessage" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId", "message"],
        "type" => "object"
      },
      "logLeaveConvo" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId"],
        "type" => "object"
      },
      "logMuteConvo" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId"],
        "type" => "object"
      },
      "logReadMessage" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId", "message"],
        "type" => "object"
      },
      "logRemoveReaction" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "message" => %{
            "refs" => ["#messageView", "#deletedMessageView"],
            "type" => "union"
          },
          "reaction" => %{"ref" => "#reactionView", "type" => "ref"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId", "message", "reaction"],
        "type" => "object"
      },
      "logUnmuteConvo" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "rev" => %{"type" => "string"}
        },
        "required" => ["rev", "convoId"],
        "type" => "object"
      },
      "messageAndReactionView" => %{
        "properties" => %{
          "message" => %{"ref" => "#messageView", "type" => "ref"},
          "reaction" => %{"ref" => "#reactionView", "type" => "ref"}
        },
        "required" => ["message", "reaction"],
        "type" => "object"
      },
      "messageInput" => %{
        "properties" => %{
          "embed" => %{"refs" => ["app.bsky.embed.record"], "type" => "union"},
          "facets" => %{
            "description" => "Annotations of text (mentions, URLs, hashtags, etc)",
            "items" => %{"ref" => "app.bsky.richtext.facet", "type" => "ref"},
            "type" => "array"
          },
          "text" => %{
            "maxGraphemes" => 1000,
            "maxLength" => 10000,
            "type" => "string"
          }
        },
        "required" => ["text"],
        "type" => "object"
      },
      "messageRef" => %{
        "properties" => %{
          "convoId" => %{"type" => "string"},
          "did" => %{"format" => "did", "type" => "string"},
          "messageId" => %{"type" => "string"}
        },
        "required" => ["did", "messageId", "convoId"],
        "type" => "object"
      },
      "messageView" => %{
        "properties" => %{
          "embed" => %{
            "refs" => ["app.bsky.embed.record#view"],
            "type" => "union"
          },
          "facets" => %{
            "description" => "Annotations of text (mentions, URLs, hashtags, etc)",
            "items" => %{"ref" => "app.bsky.richtext.facet", "type" => "ref"},
            "type" => "array"
          },
          "id" => %{"type" => "string"},
          "reactions" => %{
            "description" => "Reactions to this message, in ascending order of creation time.",
            "items" => %{"ref" => "#reactionView", "type" => "ref"},
            "type" => "array"
          },
          "rev" => %{"type" => "string"},
          "sender" => %{"ref" => "#messageViewSender", "type" => "ref"},
          "sentAt" => %{"format" => "datetime", "type" => "string"},
          "text" => %{
            "maxGraphemes" => 1000,
            "maxLength" => 10000,
            "type" => "string"
          }
        },
        "required" => ["id", "rev", "text", "sender", "sentAt"],
        "type" => "object"
      },
      "messageViewSender" => %{
        "properties" => %{"did" => %{"format" => "did", "type" => "string"}},
        "required" => ["did"],
        "type" => "object"
      },
      "reactionView" => %{
        "properties" => %{
          "createdAt" => %{"format" => "datetime", "type" => "string"},
          "sender" => %{"ref" => "#reactionViewSender", "type" => "ref"},
          "value" => %{"type" => "string"}
        },
        "required" => ["value", "sender", "createdAt"],
        "type" => "object"
      },
      "reactionViewSender" => %{
        "properties" => %{"did" => %{"format" => "did", "type" => "string"}},
        "required" => ["did"],
        "type" => "object"
      }
    },
    "id" => "chat.bsky.convo.defs",
    "lexicon" => 1
  })
end
