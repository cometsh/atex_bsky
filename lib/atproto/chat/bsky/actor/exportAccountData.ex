defmodule Chat.Bsky.Actor.ExportAccountData do
  @moduledoc false
  use Atex.Lexicon

  deflexicon(%{
    "defs" => %{
      "main" => %{
        "output" => %{"encoding" => "application/jsonl"},
        "type" => "query"
      }
    },
    "id" => "chat.bsky.actor.exportAccountData",
    "lexicon" => 1
  })
end
