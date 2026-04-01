defmodule App.Bsky.Unspecced.SearchStarterPacksSkeleton do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Backend Starter Pack search, returns only skeleton.",
        "errors" => [%{"name" => "BadQueryString"}],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "hitsTotal" => %{
                "description" =>
                  "Count of search hits. Optional, may be rounded/truncated, and may not be possible to paginate through all hits.",
                "type" => "integer"
              },
              "starterPacks" => %{
                "items" => %{
                  "ref" => "app.bsky.unspecced.defs#skeletonSearchStarterPack",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["starterPacks"],
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
                "Search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.",
              "type" => "string"
            },
            "viewer" => %{
              "description" =>
                "DID of the account making the request (not included for public/unauthenticated queries).",
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
    "id" => "app.bsky.unspecced.searchStarterPacksSkeleton",
    "lexicon" => 1
  })
end
