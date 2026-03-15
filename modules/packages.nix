{ pkgs, matugen, ... }:

{
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = { 
        enable = true;
        theme = "agnoster";
        plugins = [ "git" "sudo" "z" ];
      };

      shellAliases = { 
        ll        = "ls -lh";
        lg        = "lazygit";
        gs        = "git status";
        tree      = "find . -print | sed -e 's#[^-][^/]*/#| #g' -e 's#| \\([^|]\\)#|--- \\1#'";
        cls       = "clear";
        rebuild   = "sudo nixos-rebuild switch --flake --upgrade";
        nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";
        r         = "sudo reboot";
        f         = "fastfetch";
        s         = "shuf";
        y         = "yes";     };
    };

obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
      obs-pipewire-audio-capture
    ];
  };
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
  
  xdg.portal = { enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "hyprland";
  };

  environment.systemPackages = with pkgs; [
    jdk21
    owofetch
    anki
    easyeffects
    kdePackages.okular    
    gimp
    protonup-qt
    sqlite
    sqlite.dev
    vscode
    fastfetch
    lazygit
    helix
    wl-clipboard
    grim
    slurp
    wf-recorder
    kitty
    waybar
    swww
    rofi
    btop
    libnotify
    bluetui
    pwvucontrol
    alsa-utils
    vivaldi
    unzip
    telegram-desktop
    spotify
    cava
    unimatrix
    feh
    mpv
    btop
    rose-pine-hyprcursor
    swaynotificationcenter
    kdePackages.breeze
    kdePackages.breeze-gtk
    (builtins.getAttr  pkgs.stdenv.hostPlatform.system matugen.packages).default
    git
    bluetui
    SDL2
    clang-tools
    unzip
    nodejs
    wget
    curl
    gcc
    gnumake
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans 
    nerd-fonts.fira-code
  ];
environment.variables = {
  GTK_IM_MODULE = "fcitx";
  QT_IM_MODULE  = "fcitx";
  XMODIFIERS    = "@im=fcitx";
};
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [ ];
}
