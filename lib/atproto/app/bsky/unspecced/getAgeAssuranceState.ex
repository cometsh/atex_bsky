defmodule App.Bsky.Unspecced.GetAgeAssuranceState do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Returns the current state of the age assurance process for an account. This is used to check if the user has completed age assurance or if further action is required.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "ref" => "app.bsky.unspecced.defs#ageAssuranceState",
            "type" => "ref"
          }
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getAgeAssuranceState",
    "lexicon" => 1
  })
end
