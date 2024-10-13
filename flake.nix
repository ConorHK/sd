{
  description = "A flake to package the sd tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      # Define the sd package for the current system
      packages = {
        default = pkgs.stdenv.mkDerivation {
          pname = "sd";
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
