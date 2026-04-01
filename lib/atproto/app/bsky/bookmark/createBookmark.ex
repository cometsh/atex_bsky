defmodule App.Bsky.Bookmark.CreateBookmark do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Creates a private bookmark for the specified record. Currently, only `app.bsky.feed.post` records are supported. Requires authentication.",
        "errors" => [
          %{
            "description" => "The URI to be bookmarked is for an unsupported collection.",
            "name" => "UnsupportedCollection"
          }
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cid" => %{"format" => "cid", "type" => "string"},
              "uri" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["uri", "cid"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.bookmark.createBookmark",
    "lexicon" => 1
  })
end
