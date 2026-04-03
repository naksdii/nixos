{
  inputs,
  ...
}:

{

  hardware.pulseaudio.enable = false;

  services = {
    zerotierone.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.extraConfig = {
        "10-fix-easyeffects" = {
          "wireplumber.settings" = {
            "device.routes.default-sink-priority" = 2000;
          };
          # Alterado de monitor.alsa.rules para monitor.libpipewire-links ou regras genéricas
          "monitor.pipewire.rules" = [
            {
              matches = [ { "node.name" = "~easyeffects_sink"; } ];
              actions = {
                update-props = {
                  "priority.driver" = 2000;
                  "priority.session" = 2000;
                  "node.passive" = false;
                  "session.suspend-on-idle" = false;
                };
              };
            }
            {
              matches = [ { "node.name" = "~easyeffects_source"; } ];
              actions = {
                update-props = {
                  "priority.driver" = 2000;
                  "priority.session" = 2000;
                  "node.passive" = false;

                };
              };
            }
          ];
        };
      };
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
    xserver.videoDrivers = [ "intel" ];
    chrony.enable = true;

  };
}
