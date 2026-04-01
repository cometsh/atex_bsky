defmodule App.Bsky.Graph.MuteActorList do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Creates a mute relationship for the specified list of accounts. Mutes are private in Bluesky. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "list" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["list"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.muteActorList",
    "lexicon" => 1
  })
end
