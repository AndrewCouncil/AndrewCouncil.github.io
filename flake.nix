{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        myHugo = pkgs.hugo.overrideAttrs (old: {
          version = "0.149.0";
          src = pkgs.fetchFromGitHub {
            owner = "bizmythy";
            repo = "hugo";
            rev = "89ab889d76e05b0b681368f6900597f92733df7c";
            hash = "sha256-I7FN2fLWfGbOzUxN/+25P9Cg8AQAhyr8616nfWupCR0=";
          };
          vendorHash = "sha256-aLlFDP6kuhRphLbkM52V8zsNpDSa0ef29fPmE9FPdDE=";
          doCheck = false;
        });

        maskWrapped = pkgs.writeShellApplication {
          name = "mask";
          runtimeInputs = [
            pkgs.uv
            pkgs.mask
          ];
          text = ''
            uv run mask "$@"
          '';
        };

        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            (aspellWithDicts (ps: with ps; [ en ]))
            # keep-sorted start
            dart-sass
            go
            maskWrapped
            myHugo
            nushell
            pandoc
            texlive.combined.scheme-small
            uv
            zellij
            # keep-sorted end
          ];
        };

        formatter = treefmtEval.config.build.wrapper;
        checks.formatting = treefmtEval.config.build.check self;
      }
    );
}
