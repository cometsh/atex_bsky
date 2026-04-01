defmodule App.Bsky.Feed.SendInteractions do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Send information about interactions with feed items back to the feed generator that served them.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "feed" => %{"format" => "at-uri", "type" => "string"},
              "interactions" => %{
                "items" => %{
                  "ref" => "app.bsky.feed.defs#interaction",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["interactions"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.feed.sendInteractions",
    "lexicon" => 1
  })
end
