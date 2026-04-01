defmodule App.Bsky.Feed.GetQuotes do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get a list of quotes for a given post.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cid" => %{"format" => "cid", "type" => "string"},
              "cursor" => %{"type" => "string"},
              "posts" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#postView",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "uri" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["uri", "posts"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cid" => %{
              "description" =>
                "If supplied, filters to quotes of specific version (by CID) of the post record.",
              "format" => "cid",
              "type" => "string"
            },
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "uri" => %{
              "description" => "Reference (AT-URI) of post record",
              "format" => "at-uri",
              "type" => "string"
            }
          },
          "required" => ["uri"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.getQuotes",
    "lexicon" => 1
  })
end
