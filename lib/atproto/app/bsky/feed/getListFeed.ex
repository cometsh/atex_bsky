defmodule App.Bsky.Feed.GetListFeed do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Get a feed of recent posts from a list (posts and reposts from any actors on the list). Does not require auth.",
        "errors" => [%{"name" => "UnknownList"}],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "feed" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#feedViewPost",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["feed"],
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
            },
            "list" => %{
              "description" => "Reference (AT-URI) to the list record.",
              "format" => "at-uri",
              "type" => "string"
            }
          },
          "required" => ["list"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getListFeed",
    "lexicon" => 1
  })
end
