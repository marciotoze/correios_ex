defmodule CorreiosEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :correios_ex,
      version: File.read!("VERSION"),
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "CorreiosEx",
      source_url: "https://github.com/marciotoze/correios_ex",
      homepage_url: "https://github.com/marciotoze/correios_ex",
      docs: &docs/0
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CorreiosEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false, warn_if_outdated: true}
    ]
  end

  defp docs do
    [
      main: "CorreiosEx",
      extras: ["README.md"]
    ]
  end
end
