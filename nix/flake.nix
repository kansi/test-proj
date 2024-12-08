# References
# https://github.com/jurraca/elixir-templates/blob/main/release/flake.nix
# https://github.com/ydlr/mix2nix
# https://nixos.org/manual/nixpkgs/stable/#packaging-beam-applications
# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/beam.section.md
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/beam-modules/mix-release.nix

{
  description = "Test project: backend api service";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    # build for each default system of flake-utils: ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"]
    flake-utils.lib.eachDefaultSystem (system:
      let

        # Declare pkgs for the specific target system we're building for.
        pkgs = import nixpkgs { inherit system ; };

        # Declare BEAM version we want to use.
        erlang = pkgs.erlang;

        # rebar3WithPc = pkgs.beam.rebar3WithPlugins { globalPlugins = [pkgs.beam.pc]; };

        # NOTE: using pkgs.erlang instead of pkgs.beam.interpreters.erlang_* to
        # avoid buidling erlang
        beamPackages = pkgs.beam.packagesWith erlang;
        elixir = beamPackages.elixir_1_14;

        devShell = import ./shell.nix { inherit pkgs elixir beamPackages; };

        test-project = let
          lib = pkgs.lib;

          # Import the Mix deps into Nix by running, mix2nix > nix/deps.nix
          mixNixDeps0 = import ./deps.nix { inherit lib beamPackages; };
          # Rebar3 needs PC plugin to compile erlexec
          # we override the buildPlugin for `buildRebar3` packages and recompile exec
          erlexec = mixNixDeps0.erlexec.override { buildPlugins = [beamPackages.pc]; };
          # override the default erlexec from mixNixDeps0 with the custom erlexec
          mixNixDeps = mixNixDeps0 // { erlexec = erlexec; };

        in beamPackages.mixRelease {
          pname = "test-proj";
          # Elixir app source path
          src = ../test_proj;
          version = "0.1.0";

          elixir = elixir;
          erlang = erlang;

          inherit mixNixDeps;

          # Add other inputs to the build if you need to
          # TODO Check if we to use glibcLocales
          # nativeBuildInputs = with pkgs; [
          #   go
          #   libcap
          #   ffmpeg
          #   vips
          #   glibc
          #   glibcLocales
          # ];
        };
      in
        {
          devShells.default = devShell;
          packages.default = test-project;
        }
    );
}