{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    matugen.url = "github:InioX/Matugen";
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
    yt-x = {
    url = "github:Benexl/yt-x";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  };

  outputs = {
    self,
    nixpkgs,
    matugen,
    nixos-grub-themes,
    ...
  }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (nixpkgs.lib.getName pkg) [
          "discord" "vscode" "vivaldi" "spotify"
          "steam" "steam-unwrapped"
        ];
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = {
        inherit matugen nixos-grub-themes;
      };

      modules = [
        ./modules/hardware-configuration.nix
        ./modules/locale.nix
        ./modules/services.nix
        ./modules/boot.nix
        ./modules/packages.nix
        ./modules/hardware.nix
        ./modules/os-config.nix
        ./modules/users.nix
      ];
    };
  };
}
