defmodule App.Bsky.Actor.SearchActorsTypeahead do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Find actor suggestions for a prefix search term. Expected use is for auto-completion during text field entry. Does not require auth.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actors" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileViewBasic",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["actors"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "limit" => %{
              "default" => 10,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "q" => %{
              "description" => "Search query prefix; not a full query string.",
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
    "id" => "app.bsky.actor.searchActorsTypeahead",
    "lexicon" => 1
  })
end
