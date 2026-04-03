{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    matugen.url = "github:InioX/Matugen";
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      matugen,
      nixos-grub-themes,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system pkgs;

          specialArgs = { inherit matugen inputs nixos-grub-themes; };

          modules = [
            ./modules/hardware-configuration.nix
            ./modules/locale.nix
            ./modules/services.nix
            ./modules/boot.nix
            ./modules/packages.nix
            # ./modules/hardware.nix
            ./modules/os-config.nix
            # ./modules/users.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.naksdii = import ./home.nix;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
