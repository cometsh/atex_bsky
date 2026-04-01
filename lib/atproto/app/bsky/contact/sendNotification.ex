defmodule App.Bsky.Contact.SendNotification do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "System endpoint to send notifications related to contact imports. Requires role authentication.",
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
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
          }
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.contact.sendNotification",
    "lexicon" => 1
  })
end
