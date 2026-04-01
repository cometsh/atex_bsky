defmodule App.Bsky.Ageassurance.GetState do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Returns server-computed Age Assurance state, if available, and any additional metadata needed to compute Age Assurance state client-side.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "metadata" => %{
                "ref" => "app.bsky.ageassurance.defs#stateMetadata",
                "type" => "ref"
              },
              "state" => %{
                "ref" => "app.bsky.ageassurance.defs#state",
                "type" => "ref"
              }
            },
            "required" => ["state", "metadata"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "countryCode" => %{"type" => "string"},
            "regionCode" => %{"type" => "string"}
          },
          "required" => ["countryCode"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.ageassurance.getState",
    "lexicon" => 1
  })
end
