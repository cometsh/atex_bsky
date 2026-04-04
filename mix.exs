defmodule AtexBsky.MixProject do
  use Mix.Project

  @version "0.1.1"
  @github "https://github.com/cometsh/atex_bsky"
  @tangled "https://tangled.sh/@comet.sh/atex_bsky"

  def project do
    [
      app: :atex_bsky,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      name: "atex_bsky",
      description: "Pre-packaged `app.bsky` and `chat.bsky` AT Protocol lexicons.",
      deps: deps(),
      package: package()
    ]
  end

  def application, do: []

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @github, "Tangled" => @tangled}
    ]
  end

  defp deps do
    [
      {:atex, "~> 0.8"},
      {:ex_doc, "~> 0.39", only: :dev, runtime: false, warn_if_outdated: true}
    ]
  end
end
