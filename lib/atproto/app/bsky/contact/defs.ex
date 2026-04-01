defmodule App.Bsky.Contact.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "matchAndContactIndex" => %{
        "description" =>
          "Associates a profile with the positional index of the contact import input in the call to `app.bsky.contact.importContacts`, so clients can know which phone caused a particular match.",
        "properties" => %{
          "contactIndex" => %{
            "description" => "The index of this match in the import contact input.",
            "maximum" => 999,
            "minimum" => 0,
            "type" => "integer"
          },
          "match" => %{
            "description" => "Profile of the matched user.",
            "ref" => "app.bsky.actor.defs#profileView",
            "type" => "ref"
          }
        },
        "required" => ["match", "contactIndex"],
        "type" => "object"
      },
      "notification" => %{
        "description" =>
          "A stash object to be sent via bsync representing a notification to be created.",
        "properties" => %{
          "from" => %{
            "description" => "The DID of who this notification comes from.",
            "format" => "did",
            "type" => "string"
          },
          "to" => %{
            "description" => "The DID of who this notification should go to.",
            "format" => "did",
            "type" => "string"
          }
        },
        "required" => ["from", "to"],
        "type" => "object"
      },
      "syncStatus" => %{
        "properties" => %{
          "matchesCount" => %{
            "description" =>
              "Number of existing contact matches resulting of the user imports and of their imported contacts having imported the user. Matches stop being counted when the user either follows the matched contact or dismisses the match.",
            "minimum" => 0,
            "type" => "integer"
          },
          "syncedAt" => %{
            "description" => "Last date when contacts where imported.",
            "format" => "datetime",
            "type" => "string"
          }
        },
        "required" => ["syncedAt", "matchesCount"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.contact.defs",
    "lexicon" => 1
  })
end
