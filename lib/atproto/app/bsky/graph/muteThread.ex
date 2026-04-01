defmodule App.Bsky.Graph.MuteThread do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "root" => %{"format" => "at-uri", "type" => "string"}
            },
            "required" => ["root"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.graph.muteThread",
    "lexicon" => 1
  })
end
