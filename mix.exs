defmodule Islands.Client.Mover.MixProject do
  use Mix.Project

  def project do
    [
      app: :islands_client_mover,
      version: "0.1.14",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      name: "Islands Client Mover",
      source_url: source_url(),
      description: description(),
      package: package(),
      deps: deps(),
      dialyzer: [plt_add_apps: [:islands_engine]]
    ]
  end

  defp source_url do
    "https://github.com/RaymondLoranger/islands_client_mover"
  end

  defp description do
    """
    Makes a move in the Game of Islands.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Raymond Loranger"],
      licenses: ["MIT"],
      links: %{"GitHub" => source_url()}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      included_applications: [:islands_engine],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:islands_client_island_type, "~> 0.1"},
      {:islands_client_state, "~> 0.1"},
      {:islands_engine, "~> 0.2"}
    ]
  end
end
