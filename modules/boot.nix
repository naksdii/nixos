{
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
        useOSProber = true; # Pode manter, mas vamos garantir com o código abaixo
        
        extraEntries = ''
          menuentry "Void Linux" {
            insmod part_gpt
            insmod ext2
            # Substitua o UUID abaixo pelo UUID da partição ROOT do seu Void
            # Rode 'lsblk -f' no terminal para achar o UUID correto
            search --no-floppy --fs-uuid --set=root XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
            linux /boot/vmlinuz root=UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX rw
            initrd /boot/initramfs-linux.img
          }
        '';
      };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "coretemp" ];
    kernelParams = [ "quiet" "loglevel=3" ];
  };
}

