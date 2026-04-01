defmodule App.Bsky.Embed.RecordWithMedia do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "properties" => %{
          "media" => %{
            "refs" => ["app.bsky.embed.images", "app.bsky.embed.video", "app.bsky.embed.external"],
            "type" => "union"
          },
          "record" => %{"ref" => "app.bsky.embed.record", "type" => "ref"}
        },
        "required" => ["record", "media"],
        "type" => "object"
      },
      "view" => %{
        "properties" => %{
          "media" => %{
            "refs" => [
              "app.bsky.embed.images#view",
              "app.bsky.embed.video#view",
              "app.bsky.embed.external#view"
            ],
            "type" => "union"
          },
          "record" => %{"ref" => "app.bsky.embed.record#view", "type" => "ref"}
        },
        "required" => ["record", "media"],
        "type" => "object"
      }
    },
    "description" =>
      "A representation of a record embedded in a Bluesky record (eg, a post), alongside other compatible embeds. For example, a quote post and image, or a quote post and external URL card.",
    "id" => "app.bsky.embed.recordWithMedia",
    "lexicon" => 1
  })
end
