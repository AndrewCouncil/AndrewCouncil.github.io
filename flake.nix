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
            rev = "9002fe9bc52b3f8528dfb5b9caeea0b88d64c03b";
            hash = "sha256-6YAHonrW67ogSBdkyboBUYtkOeFov1qUFJImWOXhHtg=";
          };
          vendorHash = "sha256-z8+WJfMS0Z89NeqIOvYWfKQHzfqv7vFuiiE3d4eodFE=";
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
