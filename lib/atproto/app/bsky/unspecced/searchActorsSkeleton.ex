defmodule App.Bsky.Unspecced.SearchActorsSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Backend Actors (profile) search, returns only skeleton.",
        "errors" => [%{"name" => "BadQueryString"}],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actors" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#skeletonSearchActor",
                  "type" => "ref"
                },
                "type" => "array"
              },
              "cursor" => %{"type" => "string"},
              "hitsTotal" => %{
                "description" =>
                  "Count of search hits. Optional, may be rounded/truncated, and may not be possible to paginate through all hits.",
                "type" => "integer"
              }
            },
            "required" => ["actors"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{
              "description" =>
                "Optional pagination mechanism; may not necessarily allow scrolling through entire result set.",
              "type" => "string"
            },
            "limit" => %{
              "default" => 25,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "q" => %{
              "description" =>
                "Search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended. For typeahead search, only simple term match is supported, not full syntax.",
              "type" => "string"
            },
            "typeahead" => %{
              "description" => "If true, acts as fast/simple 'typeahead' query.",
              "type" => "boolean"
            },
            "viewer" => %{
              "description" =>
                "DID of the account making the request (not included for public/unauthenticated queries). Used to boost followed accounts in ranking.",
              "format" => "did",
              "type" => "string"
            }
          },
          "required" => ["q"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.searchActorsSkeleton",
    "lexicon" => 1
  })
end
