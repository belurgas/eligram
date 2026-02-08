defmodule Eligram.MixProject do
  use Mix.Project

  def project do
    [
      app: :eligram,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "A library for tags with incredible features thar are fully revealed on elixir ",
      package: [
        licenses: ["Apache-2.0"],
        links: %{"GitHub" => "https://github.com/belurgas/eligram"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Eligram.Application, []}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md",
        "guides/en/gettings-started.md",
        "guides/en/about-project.md",
        "guides/en/handles.md"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
