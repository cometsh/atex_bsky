defmodule App.Bsky.Unspecced.GetConfig do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "liveNowConfig" => %{
        "properties" => %{
          "did" => %{"format" => "did", "type" => "string"},
          "domains" => %{"items" => %{"type" => "string"}, "type" => "array"}
        },
        "required" => ["did", "domains"],
        "type" => "object"
      },
      "main" => %{
        "description" => "Get miscellaneous runtime configuration.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "checkEmailConfirmed" => %{"type" => "boolean"},
              "liveNow" => %{
                "items" => %{"ref" => "#liveNowConfig", "type" => "ref"},
                "type" => "array"
              }
            },
            "required" => [],
            "type" => "object"
          }
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.unspecced.getConfig",
    "lexicon" => 1
  })
end
