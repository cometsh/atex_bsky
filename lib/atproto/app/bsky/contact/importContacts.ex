defmodule App.Bsky.Contact.ImportContacts do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Import contacts for securely matching with other users. This follows the protocol explained in https://docs.bsky.app/blog/contact-import-rfc. Requires authentication.",
        "errors" => [
          %{"name" => "InvalidDid"},
          %{"name" => "InvalidContacts"},
          %{"name" => "TooManyContacts"},
          %{"name" => "InvalidToken"},
          %{"name" => "InternalError"}
        ],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "contacts" => %{
                "description" =>
                  "List of phone numbers in global E.164 format (e.g., '+12125550123'). Phone numbers that cannot be normalized into a valid phone number will be discarded. Should not repeat the 'phone' input used in `app.bsky.contact.verifyPhone`.",
                "items" => %{"type" => "string"},
                "maxLength" => 1000,
                "minLength" => 1,
                "type" => "array"
              },
              "token" => %{
                "description" =>
                  "JWT to authenticate the call. Use the JWT received as a response to the call to `app.bsky.contact.verifyPhone`.",
                "type" => "string"
              }
            },
            "required" => ["token", "contacts"],
            "type" => "object"
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "matchesAndContactIndexes" => %{
                "description" =>
                  "The users that matched during import and their indexes on the input contacts, so the client can correlate with its local list.",
                "items" => %{
                  "ref" => "app.bsky.contact.defs#matchAndContactIndex",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["matchesAndContactIndexes"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.contact.importContacts",
    "lexicon" => 1
  })
end
