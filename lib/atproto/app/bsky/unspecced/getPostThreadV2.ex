defmodule App.Bsky.Unspecced.GetPostThreadV2 do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "(NOTE: this endpoint is under development and WILL change without notice. Don't use it until it is moved out of `unspecced` or your application WILL break) Get posts in a thread. It is based in an anchor post at any depth of the tree, and returns posts above it (recursively resolving the parent, without further branching to their replies) and below it (recursive replies, with branching to their replies). Does not require auth, but additional metadata and filtering will be applied for authed requests.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "hasOtherReplies" => %{
                "description" =>
                  "Whether this thread has additional replies. If true, a call can be made to the `getPostThreadOtherV2` endpoint to retrieve them.",
                "type" => "boolean"
              },
              "thread" => %{
                "description" =>
                  "A flat list of thread items. The depth of each item is indicated by the depth property inside the item.",
                "items" => %{"ref" => "#threadItem", "type" => "ref"},
                "type" => "array"
              },
              "threadgate" => %{
                "ref" => "app.bsky.feed.defs#threadgateView",
                "type" => "ref"
              }
            },
            "required" => ["thread", "hasOtherReplies"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "above" => %{
              "default" => true,
              "description" => "Whether to include parents above the anchor.",
              "type" => "boolean"
            },
            "anchor" => %{
              "description" =>
                "Reference (AT-URI) to post record. This is the anchor post, and the thread will be built around it. It can be any post in the tree, not necessarily a root post.",
              "format" => "at-uri",
              "type" => "string"
            },
            "below" => %{
              "default" => 6,
              "description" => "How many levels of replies to include below the anchor.",
              "maximum" => 20,
              "minimum" => 0,
              "type" => "integer"
            },
            "branchingFactor" => %{
              "default" => 10,
              "description" =>
                "Maximum of replies to include at each level of the thread, except for the direct replies to the anchor, which are (NOTE: currently, during unspecced phase) all returned (NOTE: later they might be paginated).",
              "maximum" => 100,
              "minimum" => 0,
              "type" => "integer"
            },
            "sort" => %{
              "default" => "oldest",
              "description" => "Sorting for the thread replies.",
              "knownValues" => ["newest", "oldest", "top"],
              "type" => "string"
            }
          },
          "required" => ["anchor"],
          "type" => "params"
        },
        "type" => "query"
      },
      "threadItem" => %{
        "properties" => %{
          "depth" => %{
            "description" =>
              "The nesting level of this item in the thread. Depth 0 means the anchor item. Items above have negative depths, items below have positive depths.",
            "type" => "integer"
          },
          "uri" => %{"format" => "at-uri", "type" => "string"},
          "value" => %{
            "refs" => [
              "app.bsky.unspecced.defs#threadItemPost",
              "app.bsky.unspecced.defs#threadItemNoUnauthenticated",
              "app.bsky.unspecced.defs#threadItemNotFound",
              "app.bsky.unspecced.defs#threadItemBlocked"
            ],
            "type" => "union"
          }
        },
        "required" => ["uri", "depth", "value"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.unspecced.getPostThreadV2",
    "lexicon" => 1
  })
end
