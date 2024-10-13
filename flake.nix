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
        default = pkgs.stdenvNoCC.mkDerivation rec {
          pname = "script-directory";
          version = "1.1.0";
          src = ./.;

          nativeBuildInputs = [
            pkgs.installShellFiles
            pkgs.patsh
          ];

          installPhase = ''
            runHook preInstall
            patsh -f sd
            install -Dt "$out/bin" sd
            installShellCompletion --zsh _sd
            runHook postInstall
          '';

          meta = {
            description = "A cozy nest for your scripts";
            homepage = "https://github.com/conorhk/sd";
            changelog = "https://github.com/conorhk/sd/tree/${src.rev}#changelog";
            license = pkgs.lib.licenses.mit;
            mainProgram = "sd";
          };
      };
    };
  });
}
