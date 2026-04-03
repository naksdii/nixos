{
  inputs,
  pkgs,
  matugen,
  ...
}:

{

  programs = {
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "hyprland";
  };

  environment.systemPackages = with pkgs; [
    home-manager
    zerotierone
    openssh
    protonup-qt
    btop
    libnotify
    bluetui
    alsa-utils
    unzip
    bluetui
    unzip
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [ ];
}
