defmodule App.Bsky.Video.GetJobStatus do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "description" => "Get status details for a video processing job.",
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
        "parameters" => %{
          "properties" => %{"jobId" => %{"type" => "string"}},
          "required" => ["jobId"],
          "type" => "params"
        },
        "type" => "query"
      }
    },
    "id" => "app.bsky.video.getJobStatus",
    "lexicon" => 1
  })
end
