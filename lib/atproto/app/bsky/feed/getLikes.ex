defmodule App.Bsky.Feed.GetLikes do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "like" => %{
        "properties" => %{
          "actor" => %{
            "ref" => "app.bsky.actor.defs#profileView",
            "type" => "ref"
          },
          "createdAt" => %{"format" => "datetime", "type" => "string"},
          "indexedAt" => %{"format" => "datetime", "type" => "string"}
        },
        "required" => ["indexedAt", "createdAt", "actor"],
        "type" => "object"
      },
      "main" => %{
        "description" => "Get like records which reference a subject (by AT-URI and CID).",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cid" => %{"format" => "cid", "type" => "string"},
              "cursor" => %{"type" => "string"},
              "likes" => %{
                "items" => %{"ref" => "#like", "type" => "ref"},
                "type" => "array"
              },
              "uri" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["uri", "likes"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cid" => %{
              "description" =>
                "CID of the subject record (aka, specific version of record), to filter likes.",
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
              "description" => "AT-URI of the subject (eg, a post record).",
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
    "id" => "app.bsky.feed.getLikes",
    "lexicon" => 1
  })
end
