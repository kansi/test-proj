defmodule TestProj.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_proj,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        test_proj: [
          cookie: "secret-token",
          include_erts: true,
          include_executables_for: [:unix],
          applications: [test_proj: :permanent, runtime_tools: :permanent],
          steps: [:assemble, :tar]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TestProj.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.6.6"},
    ]
  end
end
