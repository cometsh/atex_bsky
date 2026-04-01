defmodule App.Bsky.Contact.VerifyPhone do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Verifies control over a phone number with a code received via SMS and starts a contact import session. Requires authentication.",
        "errors" => [
          %{"name" => "RateLimitExceeded"},
          %{"name" => "InvalidDid"},
          %{"name" => "InvalidPhone"},
          %{"name" => "InvalidCode"},
          %{"name" => "InternalError"}
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "code" => %{
                "description" =>
                  "The code received via SMS as a result of the call to `app.bsky.contact.startPhoneVerification`.",
                "type" => "string"
              },
              "phone" => %{
                "description" =>
                  "The phone number to verify. Should be the same as the one passed to `app.bsky.contact.startPhoneVerification`.",
                "type" => "string"
              }
            },
            "required" => ["phone", "code"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "token" => %{
                "description" =>
                  "JWT to be used in a call to `app.bsky.contact.importContacts`. It is only valid for a single call.",
                "type" => "string"
              }
            },
            "required" => ["token"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.contact.verifyPhone",
    "lexicon" => 1
  })
end
