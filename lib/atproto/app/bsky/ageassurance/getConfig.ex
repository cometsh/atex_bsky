defmodule App.Bsky.Ageassurance.GetConfig do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Returns Age Assurance configuration for use on the client.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "ref" => "app.bsky.ageassurance.defs#config",
            "type" => "ref"
          }
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.ageassurance.getConfig",
    "lexicon" => 1
  })
end
