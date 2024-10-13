{
  description = "conorhk's fork of ianthehenry's script-directory tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages = {
        default = pkgs.stdenv.mkDerivation {
          pname = "script-directory";
          version = "1.0.0";
          src = ./.;
          installPhase = ''
            mkdir -p $out/bin
            cp ./sd $out/bin/sd
            chmod +x $out/bin/sd
          '';
        };
      };
    });
}
