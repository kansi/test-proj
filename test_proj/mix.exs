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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:bcrypt_elixir, "~> 2.0"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_machina, "~> 2.4", only: [:test, :dev]},
      {:tailwind, "~> 0.1", runtime: Mix.env() == :dev},
      # make it only dev
      {:cors_plug, "~> 3.0"},
      {:phoenix, "~> 1.6.6"},
      {:phoenix_ecto, "~> 4.6"},
      {:ecto_sql, "~> 3.12"},
      {:typed_ecto_schema, "~> 0.4.1", runtime: false},
      {:typed_struct, "~> 0.3.0"},
      {:ex_aws, "~> 2.3"},
      {:ex_aws_s3, "~> 2.3"},
      {:sweet_xml, "~> 0.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.3", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.22.1"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:open_api_spex, "~> 3.18"},
      {:reverse_proxy_plug, "~> 2.1"},
      {:paginator, "~> 1.0.3"},
      {:scrivener_ecto, "~> 2.0"},
      {:erlexec, "~> 2.0"},
      {:oban, "~> 2.13"},
      {:gradient, github: "esl/gradient", only: [:dev], runtime: false},
      {:logger_file_backend, "~> 0.0.13"},
      {:prom_ex, "~> 1.9"},
    ]
  end
end
