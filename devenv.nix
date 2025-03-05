{ pkgs, lib, config, inputs, ... }:
let
  mtk_uartboot = pkgs.rustPlatform.buildRustPackage {
    pname = "mtk_uartboot";
    version = "0.1.1";
    src = pkgs.fetchFromGitHub {
      owner = "981213";
      repo = "mtk_uartboot";
      rev = "v0.1.1";
      sha256 = "sha256-mwwm2TVBfOEqvQIP0Vl4Q2SkcZxX1JP7rShmjaY+pWE=";
    };
    cargoHash = "sha256-uS4ESPWMJ1JIKvszA3oVlBIHoG2WzT5+W/9KCjKk+6s=";
  };
in 
{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
  packages = with pkgs; [ 
    git 
    mtk_uartboot
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  #
  enterShell = ''
    git --version
    mtk_uartboot --help
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
