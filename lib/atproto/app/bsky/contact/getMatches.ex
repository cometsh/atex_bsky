defmodule App.Bsky.Contact.GetMatches do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" =>
          "Returns the matched contacts (contacts that were mutually imported). Excludes dismissed matches. Requires authentication.",
        "errors" => [
          %{"name" => "InvalidDid"},
          %{"name" => "InvalidLimit"},
          %{"name" => "InvalidCursor"},
          %{"name" => "InternalError"}
        ],
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "cursor" => %{"type" => "string"},
              "matches" => %{
                "items" => %{
                  "ref" => "app.bsky.actor.defs#profileView",
                  "type" => "ref"
                },
                "type" => "array"
              }
            },
            "required" => ["matches"],
            "type" => "object"
          }
        },
        "parameters" => %{
          "properties" => %{
            "cursor" => %{"type" => "string"},
            "limit" => %{
              "default" => 50,
              "maximum" => 100,
              "minimum" => 1,
              "type" => "integer"
            }
          },
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.contact.getMatches",
    "lexicon" => 1
  })
end
