defmodule App.Bsky.Unspecced.InitAgeAssurance do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Initiate age assurance for an account. This is a one-time action that will start the process of verifying the user's age.",
        "errors" => [
          %{"name" => "InvalidEmail"},
          %{"name" => "DidTooLong"},
          %{"name" => "InvalidInitiation"}
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "countryCode" => %{
                "description" => "An ISO 3166-1 alpha-2 code of the user's location.",
                "type" => "string"
              },
              "email" => %{
                "description" => "The user's email address to receive assurance instructions.",
                "type" => "string"
              },
              "language" => %{
                "description" =>
                  "The user's preferred language for communication during the assurance process.",
                "type" => "string"
              }
            },
            "required" => ["email", "language", "countryCode"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "ref" => "app.bsky.unspecced.defs#ageAssuranceState",
            "type" => "ref"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.unspecced.initAgeAssurance",
    "lexicon" => 1
  })
end
