defmodule App.Bsky.Graph.MuteActor do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Creates a mute relationship for the specified account. Mutes are private in Bluesky. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "actor" => %{"format" => "at-identifier", "type" => "string"}
            },
            "required" => ["actor"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.muteActor",
    "lexicon" => 1
  })
end
