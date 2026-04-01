defmodule App.Bsky.Ageassurance.Begin do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Initiate Age Assurance for an account.",
        "errors" => [
          %{"name" => "InvalidEmail"},
          %{"name" => "DidTooLong"},
          %{"name" => "InvalidInitiation"},
          %{"name" => "RegionNotSupported"}
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
                "description" =>
                  "The user's email address to receive Age Assurance instructions.",
                "type" => "string"
              },
              "language" => %{
                "description" =>
                  "The user's preferred language for communication during the Age Assurance process.",
                "type" => "string"
              },
              "regionCode" => %{
                "description" =>
                  "An optional ISO 3166-2 code of the user's region or state within the country.",
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
            "ref" => "app.bsky.ageassurance.defs#state",
            "type" => "ref"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.ageassurance.begin",
    "lexicon" => 1
  })
end
