{
  pkgs,
  nixos-grub-themes,
  ...
}:

{
  boot = {
    loader = {
      timeout = 5;

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = false;

        #theme =
        #  (builtins.getAttr pkgs.system nixos-grub-themes.packages).bigsur;

      };

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "coretemp" ];
    kernelParams = [ "quiet" "loglevel=3" ];
  };
}

