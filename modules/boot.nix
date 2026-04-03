{
  inputs,
  pkgs,
  nixos-grub-themes,
  ...
}:

{
  boot = {
    loader = {
      # timeout = 5;

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;

        extraEntries = ''
          menuentry "Void Linux" {
            insmod part_gpt
            insmod ext2
            search --no-floppy --fs-uuid --set=root 8fb400f9-4ea1-4db5-8afd-d0cadc88a092
            linux /boot/vmlinuz root=UUID=8fb400f9-4ea1-4db5-8afd-d0cadc88a092 rw quiet
            initrd /boot/initrd.img
          }
        '';
      };
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "coretemp" ];
    kernelParams = [
      "quiet"
      "loglevel=3"
    ];
  };

}
