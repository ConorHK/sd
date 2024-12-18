{
  description = "conorhk's fork of ianthehenry's script-directory tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = {self, nixpkgs, ... }:
    let
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
  forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  nixpkgsFor = forAllSystems (system:
      import nixpkgs {
      inherit system;
      overlays = [self.overlay];
      });
  in {
    overlay = final: _prev: {
      sd = with final;
      stdenv.mkDerivation rec {
        pname = "script-directory";
        version = "1.1.0";
        src = ./.;

        nativeBuildInputs = [installShellFiles];
        phases = ["installPhase" "postInstall" ];

        installPhase = ''
          mkdir -p $out/bin
          cp $src/sd $out/bin/sd
          chmod +x $out/bin/sd
        '';

        postInstall = ''
          installShellCompletion --zsh $src/_sd
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

    packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system}) sd;
        });
  };
}
