defmodule App.Bsky.Bookmark.GetBookmarks do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Gets views of records bookmarked by the authenticated user. Requires authentication.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "bookmarks" => %{
                "items" => %{
                  "ref" => "app.bsky.bookmark.defs#bookmarkView",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "cursor" => %{"type" => "string"}
            },
            "required" => ["bookmarks"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.bookmark.getBookmarks",
    "lexicon" => 1
  })
end
