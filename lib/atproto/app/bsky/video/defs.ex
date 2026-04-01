defmodule App.Bsky.Video.Defs do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "jobStatus" => %{
        "properties" => %{
          "blob" => %{"type" => "blob"},
          "did" => %{"format" => "did", "type" => "string"},
          "error" => %{"type" => "string"},
          "jobId" => %{"type" => "string"},
          "message" => %{"type" => "string"},
          "progress" => %{
            "description" => "Progress within the current processing state.",
            "maximum" => 100,
            "minimum" => 0,
            "type" => "integer"
          },
          "state" => %{
            "description" =>
              "The state of the video processing job. All values not listed as a known value indicate that the job is in process.",
            "knownValues" => ["JOB_STATE_COMPLETED", "JOB_STATE_FAILED"],
            "type" => "string"
          }
        },
        "required" => ["jobId", "did", "state"],
        "type" => "object"
      }
    },
    "id" => "app.bsky.video.defs",
    "lexicon" => 1
  })
end
