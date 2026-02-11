{
  ...
}:

{

  hardware.pulseaudio.enable = false;

  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    flatpak.enable = true;

    blueman.enable = true;
    resolved.enable = false;
    timesyncd.enable = false;
    udisks2.enable = false;
    accounts-daemon.enable = false;
    colord.enable = false;
    power-profiles-daemon.enable = false;
    avahi.enable = false;
    geoclue2.enable = false;
    packagekit.enable = false;
    xserver.videoDrivers = ["intel"];


  };
}
