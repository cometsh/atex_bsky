defmodule App.Bsky.Unspecced.GetPostThreadOtherV2 do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "(NOTE: this endpoint is under development and WILL change without notice. Don't use it until it is moved out of `unspecced` or your application WILL break) Get additional posts under a thread e.g. replies hidden by threadgate. Based on an anchor post at any depth of the tree, returns top-level replies below that anchor. It does not include ancestors nor the anchor itself. This should be called after exhausting `app.bsky.unspecced.getPostThreadV2`. Does not require auth, but additional metadata and filtering will be applied for authed requests.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "thread" => %{
                "description" =>
                  "A flat list of other thread items. The depth of each item is indicated by the depth property inside the item.",
                "items" => %{"ref" => "#threadItem", "type" => "ref"},
                "type" => "array"
              }
            },
            "required" => ["thread"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "anchor" => %{
              "description" => "Reference (AT-URI) to post record. This is the anchor post.",
              "format" => "at-uri",
              "type" => "string"
            }
          },
          "required" => ["anchor"],
          "type" => "params"
        },
        "type" => "query"
      },
      "threadItem" => %{
        "properties" => %{
          "depth" => %{
            "description" =>
              "The nesting level of this item in the thread. Depth 0 means the anchor item. Items above have negative depths, items below have positive depths.",
            "type" => "integer"
          },
          "uri" => %{"format" => "at-uri", "type" => "string"},
          "value" => %{
            "refs" => ["app.bsky.unspecced.defs#threadItemPost"],
            "type" => "union"
          }
        },
        "required" => ["uri", "depth", "value"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.unspecced.getPostThreadOtherV2",
    "lexicon" => 1
  })
end
