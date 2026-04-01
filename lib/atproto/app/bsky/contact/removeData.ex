defmodule App.Bsky.Contact.RemoveData do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Removes all stored hashes used for contact matching, existing matches, and sync status. Requires authentication.",
        "errors" => [%{"name" => "InvalidDid"}, %{"name" => "InternalError"}],
        "input" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{"properties" => %{}, "type" => "object"}
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.contact.removeData",
    "lexicon" => 1
  })
end
