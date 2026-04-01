defmodule App.Bsky.Video.GetUploadLimits do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get video upload limits for the authenticated user.",
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "canUpload" => %{"type" => "boolean"},
              "error" => %{"type" => "string"},
              "message" => %{"type" => "string"},
              "remainingDailyBytes" => %{"type" => "integer"},
              "remainingDailyVideos" => %{"type" => "integer"}
            },
            "required" => ["canUpload"],
            "type" => "object"
          }
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.video.getUploadLimits",
    "lexicon" => 1
  })
end
