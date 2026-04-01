defmodule App.Bsky.Embed.External do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "external" => %{
        "properties" => %{
          "description" => %{"type" => "string"},
          "thumb" => %{
            "accept" => ["image/*"],
            "maxSize" => 1_000_000,
            "type" => "blob"
          },
          "title" => %{"type" => "string"},
          "uri" => %{"format" => "uri", "type" => "string"}
        },
        "required" => ["uri", "title", "description"],
        "type" => "object"
      },
      "main" => %{
        "description" =>
          "A representation of some externally linked content (eg, a URL and 'card'), embedded in a Bluesky record (eg, a post).",
        "properties" => %{"external" => %{"ref" => "#external", "type" => "ref"}},
        "required" => ["external"],
        "type" => "object"
      },
      "view" => %{
        "properties" => %{
          "external" => %{"ref" => "#viewExternal", "type" => "ref"}
        },
        "required" => ["external"],
        "type" => "object"
      },
      "viewExternal" => %{
        "properties" => %{
          "description" => %{"type" => "string"},
          "thumb" => %{"format" => "uri", "type" => "string"},
          "title" => %{"type" => "string"},
          "uri" => %{"format" => "uri", "type" => "string"}
        },
        "required" => ["uri", "title", "description"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.embed.external",
    "lexicon" => 1
  })
end
