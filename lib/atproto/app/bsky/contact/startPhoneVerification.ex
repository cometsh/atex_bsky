defmodule App.Bsky.Contact.StartPhoneVerification do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Starts a phone verification flow. The phone passed will receive a code via SMS that should be passed to `app.bsky.contact.verifyPhone`. Requires authentication.",
        "errors" => [
          %{"name" => "RateLimitExceeded"},
          %{"name" => "InvalidDid"},
          %{"name" => "InvalidPhone"},
          %{"name" => "InternalError"}
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "phone" => %{
                "description" => "The phone number to receive the code via SMS.",
                "type" => "string"
              }
            },
            "required" => ["phone"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.contact.startPhoneVerification",
    "lexicon" => 1
  })
end
