defmodule App.Bsky.Feed.SearchPosts do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Find posts matching search criteria, returning views of those posts. Note that this API endpoint may require authentication (eg, not public) for some service providers and implementations.",
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
              "posts" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#postView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["posts"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "author" => %{
              "description" =>
                "Filter to posts by the given account. Handles are resolved to DID before query-time.",
              "format" => "at-identifier",
              "type" => "string"
            },
            "cursor" => %{
              "description" =>
                "Optional pagination mechanism; may not necessarily allow scrolling through entire result set.",
              "type" => "string"
            },
            "domain" => %{
              "description" =>
                "Filter to posts with URLs (facet links or embeds) linking to the given domain (hostname). Server may apply hostname normalization.",
              "type" => "string"
            },
            "lang" => %{
              "description" =>
                "Filter to posts in the given language. Expected to be based on post language field, though server may override language detection.",
              "format" => "language",
              "type" => "string"
            },
            "limit" => %{
              "default" => 25,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            },
            "mentions" => %{
              "description" =>
                "Filter to posts which mention the given account. Handles are resolved to DID before query-time. Only matches rich-text facet mentions.",
              "format" => "at-identifier",
              "type" => "string"
            },
            "q" => %{
              "description" =>
                "Search query string; syntax, phrase, boolean, and faceting is unspecified, but Lucene query syntax is recommended.",
              "type" => "string"
            },
            "since" => %{
              "description" =>
                "Filter results for posts after the indicated datetime (inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYYY-MM-DD).",
              "type" => "string"
            },
            "sort" => %{
              "default" => "latest",
              "description" => "Specifies the ranking order of results.",
              "knownValues" => ["top", "latest"],
              "type" => "string"
            },
            "tag" => %{
              "description" =>
                "Filter to posts with the given tag (hashtag), based on rich-text facet or tag field. Do not include the hash (#) prefix. Multiple tags can be specified, with 'AND' matching.",
              "items" => %{
                "maxGraphemes" => 64,
                "maxLength" => 640,
                "type" => "string"
              },
              "type" => "array"
            },
            "until" => %{
              "description" =>
                "Filter results for posts before the indicated datetime (not inclusive). Expected to use 'sortAt' timestamp, which may not match 'createdAt'. Can be a datetime, or just an ISO date (YYY-MM-DD).",
              "type" => "string"
            },
            "url" => %{
              "description" =>
                "Filter to posts with links (facet links or embeds) pointing to this URL. Server may apply URL normalization or fuzzy matching.",
              "format" => "uri",
              "type" => "string"
            }
          },
          "required" => ["q"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.feed.searchPosts",
    "lexicon" => 1
  })
end
