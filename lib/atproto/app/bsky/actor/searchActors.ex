defmodule App.Bsky.Actor.SearchActors do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Find actors (profiles) matching search criteria. Does not require auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actors" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileView",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "cursor" => %{"type" => "string"}
            },
            "required" => ["actors"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 25,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "q" => %{
              "description" =>
                "Search query string. Syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.",
              "type" => "string"
            },
            "term" => %{
              "description" => "DEPRECATED: use 'q' instead.",
              "type" => "string"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.actor.searchActors",
    "lexicon" => 1
  })
end
