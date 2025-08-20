{
  description = "conorhk's fork of ianthehenry's script-directory tool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "script-directory";
          version = "1.1.0";
          src = ./.;

          nativeBuildInputs = [ pkgs.installShellFiles ];
          phases = [ "installPhase" "postInstall" ];

          installPhase = ''
            mkdir -p $out/bin
            cp $src/sd $out/bin/sd
            chmod +x $out/bin/sd
          '';

          postInstall = ''
            installShellCompletion --zsh $src/_sd
            installShellCompletion --fish $src/sd.fish
          '';

          meta = {
            description = "A cozy nest for your scripts";
            homepage = "https://github.com/conorhk/sd";
            license = pkgs.lib.licenses.mit;
            mainProgram = "sd";
          };
        };

        packages.sd = config.packages.default;
      };
    };
}
