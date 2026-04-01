defmodule App.Bsky.Video.UploadVideo do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Upload a video to be processed then stored on the PDS.",
        "input" => %{"encoding" => "video/mp4"},
        "output" => %{
          "encoding" => "application/json",
          "schema" => %{
            "properties" => %{
              "jobStatus" => %{
                "ref" => "app.bsky.video.defs#jobStatus",
                "type" => "ref"
              }
            },
            "required" => ["jobStatus"],
            "type" => "object"
          }
        },
        "type" => "procedure"
      }
    },
    "id" => "app.bsky.video.uploadVideo",
    "lexicon" => 1
  })
end
