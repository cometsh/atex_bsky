defmodule App.Bsky.Bookmark.DeleteBookmark do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Deletes a private bookmark for the specified record. Currently, only `app.bsky.feed.post` records are supported. Requires authentication.",
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
              "uri" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["uri"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.bookmark.deleteBookmark",
    "lexicon" => 1
  })
end
