defmodule App.Bsky.Bookmark.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "bookmark" => %{
        "description" => "Object used to store bookmark data in stash.",
        "properties" => %{
          "subject" => %{
            "description" =>
              "A strong ref to the record to be bookmarked. Currently, only `app.bsky.feed.post` records are supported.",
            "ref" => "com.atproto.repo.strongRef",
            "type" => "ref"
          }
        },
        "required" => ["subject"],
        "type" => "object"
      },
      "bookmarkView" => %{
        "properties" => %{
          "createdAt" => %{"format" => "datetime", "type" => "string"},
          "item" => %{
            "refs" => [
              "app.bsky.feed.defs#blockedPost",
              "app.bsky.feed.defs#notFoundPost",
              "app.bsky.feed.defs#postView"
            ],
            "type" => "union"
          },
          "subject" => %{
            "description" => "A strong ref to the bookmarked record.",
            "ref" => "com.atproto.repo.strongRef",
            "type" => "ref"
          }
        },
        "required" => ["subject", "item"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.bookmark.defs",
    "lexicon" => 1
  })
end
