{ pkgs, inputs, ... }:

{
  imports = [
    ./home/hyprland.nix
    ./home/zsh.nix
    ./home/obs.nix
    ./home/git.nix
    ./home/dotfiles.nix
  ];
  home = {
    username = "naksdii";
    homeDirectory = "/home/naksdii";
    stateVersion = "25.11";

    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    vivaldi
    telegram-desktop
    spotify
    vscode
    gimp
    anki
    kdePackages.okular
    easyeffects
    git
    cowsay
    kitty
    lazygit
    helix
    btop
    fastfetch
    hyfetch
    owofetch
    jq
    imagemagick
    ffmpeg
    waybar
    swww
    rofi
    libnotify
    swaynotificationcenter
    grim
    slurp
    wf-recorder
    wl-clipboard
    pwvucontrol
    xwayland-satellite
    cava
    tty-clock
    pipes
    unimatrix
    feh
    mpv
    rose-pine-hyprcursor
    adwaita-icon-theme
    papirus-icon-theme
    hicolor-icon-theme
    clang-tools
    gcc
    gnumake
    nodejs
    sqlite
    jdk21
    curl
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
