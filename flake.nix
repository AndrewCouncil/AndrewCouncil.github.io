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
            owner = "AndrewCouncil";
            repo = "hugo";
            rev = "8a8c94759021b8daaf1a2bb9fd2ab5d1ead0f5c9";
            hash = "sha256-Kkt/4dC2gRaInQcZyhdpl2Q5kxhIrqj5PWlQ5+rlPr4=";
          };
          vendorHash = "sha256-iZwYP99elM64ljUjbj6i2YHTUHBc3B6NVfRXMyr4jSo=";
          doCheck = false;
        });

        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            (aspellWithDicts (ps: with ps; [ en ]))
            # keep-sorted start
            go
            mask
            myHugo
            nushell
            zellij
            # keep-sorted end
          ];
        };

        formatter = treefmtEval.config.build.wrapper;
        checks.formatting = treefmtEval.config.build.check self;
      }
    );
}
