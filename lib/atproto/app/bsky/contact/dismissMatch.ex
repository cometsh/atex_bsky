defmodule App.Bsky.Contact.DismissMatch do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Removes a match that was found via contact import. It shouldn't appear again if the same contact is re-imported. Requires authentication.",
        "errors" => [%{"name" => "InvalidDid"}, %{"name" => "InternalError"}],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "subject" => %{
                "description" => "The subject's DID to dismiss the match with.",
                "format" => "did",
                "type" => "string"
              }
            },
            "required" => ["subject"],
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
    "id" => "app.bsky.contact.dismissMatch",
    "lexicon" => 1
  })
end
