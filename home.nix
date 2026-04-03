{ pkgs, inputs, ... }:

{
  home.username = "naksdii";
  home.homeDirectory = "/home/naksdii";
  home.stateVersion = "25.11"; # Mantendo a versão do seu os-config [cite: 7]

  # --- VARIÁVEIS DE AMBIENTE ---
  # Movidas de packages.nix [cite: 23, 24, 40]
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # --- CONFIGURAÇÃO DO SHELL (ZSH) ---
  # Movido de packages.nix [cite: 25, 26, 27]
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
            monitor=,preferred,auto,1
      cursor_size = 24


      ###################
      ### MY PROGRAMS ###
      ###################
      # See https://wiki.hypr.land/Configuring/Keywords/

      # Set programs that you use
      $terminal = kitty
      $menu = rofi -show drun
      source = colors.conf

      exec-once = waybar
      exec-once = swww-daemon
      exec-once = swaync
      exec-once = easyeffects --hide-window

      # Força o set-default após 3 segundos para garantir que o Easy Effects já carregou
      exec-once = sleep 10  && wpctl set-default $(wpctl status | grep "Easy Effects Sink" | awk '{print $2}' | tr -d '.')

      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = fcitx5
      env = HYPRCURSOR_THEME,rose-pine-hyprcursor
      env = HYPRCURSOR_SIZE,32
      env = XMODIFIERS, @im=fcitx
      env = QT_IM_MODULE, fcitx
      env = GTK_IM_MODULE, fcitx
      env = GTK_ICON_THEME, Papirus
      general {
          gaps_in = 5
          gaps_out = 10

          border_size = 3

          col.active_border =  $primary $primary_container 75deg
          col.inactive_border = $primary_container

          resize_on_border = false

          allow_tearing = true
      }

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      decoration {
          rounding = 9
          rounding_power = 1

          # Change transparency of focused and unfocused windows
          active_opacity = 0.9
          inactive_opacity = 0.7

          shadow {
              enabled = true
          }

          # https://wiki.hypr.land/Configuring/Variables/#blur
          blur {
              enabled = true
              size = 3
              passes = 2
              vibrancy = 1696
          }
      }

      # https://wiki.hypr.land/Configuring/Variables/#animations
      animations {
          enabled = yes, please :)

          # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
          #        NAME,           X0 Y0     X1    Y1
          bezier = easeOutQuint,   0, 0.25,  0.3,  1
          bezier = easeInOutCubic, 0, 0.05,  0.3,  1
          bezier = linear,         0, 0,     0.7,  1
          bezier = almostLinear,   0, 0.25,  0.7,  1
          bezier = quick,          0, 0,     0.1,  1

          # Default animations, see https://wiki.hypr.land/Configuring/Animations/
          #           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
          animation = global,        1,     3,    default
          animation = border,        1,     3, linear
              animation = borderangle,   1, 10,  easeOutQuint,
          animation = windows,       1,     3,  easeOutQuint, popin 0%
          animation = windowsIn,     1,     3,  easeOutQuint, popin 0%
          animation = windowsOut,    1,     3,  easeOutQuint, popin 0%
          animation = fadeIn,        1,     3,  easeOutQuint
          animation = fadeOut,       1,     3,  easeOutQuint
          animation = fade,          1,     3,  easeOutQuint
          animation = layers,        1,     3,  easeOutQuint,slide bottom
          animation = layersIn,      1,     3,  easeOutQuint,slide bottom
          animation = layersOut,     1,     4,  easeOutQuint,fade
          animation = fadeLayersIn,  1,     3,  easeOutQuint
          animation = fadeLayersOut, 1,     3,  easeOutQuint
          animation = workspaces,    1,     3,  easeOutQuint, slidevert 90%
          animation = workspacesIn,  1,     3,  easeOutQuint, slidevert 90%
          animation = workspacesOut, 1,     3,  easeOutQuint, slidevert 100%
          animation = zoomFactor,    1,     7,     quick
      }

      # See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          default_split_ratio=1
          force_split = 0
          preserve_split = 1
      }

      # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
      master {
          new_status = master
      }
      # https://wiki.hypr.land/Configuring/Variables/#misc
      misc {
          force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }


      #############
      ### INPUT ###
      #############

      # https://wiki.hypr.land/Configuring/Variables/#input
      input {
          kb_layout = br
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = false
          }
      }

      # See https://wiki.hypr.land/Configuring/Gestures
      gesture = 3, horizontal, workspace



      ###################
      ### KEYBINDINGS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Keywords/
      $mainMod = super  # Sets "Windows" key as main modifier

      bind = $mainMod, return, exec, $terminal
      bind = $mainMod, w, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, R, exec, $menu;
      bind = $mainMod, mouse:276, swapsplit
      bind = $mainMod, mouse:275, togglesplit
      bind = $mainMod, P, pseudo

      bind = SHIFT, Print, exec,  grim -g "$(slurp -b 00000000 -c 00000044 -s 00000000)" - | wl-copy
      bind =  , Print, exec, grim - |wl-copy

      bind = , f10, fullscreen

      bind = $mainMod+shift, w, exec, /home/naksdii/bin/rofi-selector.sh
      bind = $mainMod, d, exec, flatpak run com.discordapp.Discord


      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10


      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind =  $mainMod Shift, n,  exec,  swaync-client -t -sw

    '';
    # usar 'extraConfig' para colar a config antiga
  };

  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true; # Nome corrigido conforme o aviso do rebuild
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
          "sudo"
          "z"
        ];
      };

      # Substitui o seu cat ~/.zshrc antigo
      initContent = ''
        # Carrega suas variáveis de ambiente locais, se o arquivo existir
        if [ -f "$HOME/.local/bin/env" ]; then
          . "$HOME/.local/bin/env"
        fi
      '';
      shellAliases = {
        ll = "ls -lh";
        lg = "lazygit";
        gs = "git status";
        cls = "clear";
        rebuild = "sudo nixos-rebuild switch --flake .#nixos"; # Ajustado para o seu flake
        nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";
        r = "sudo reboot";
        f = "fastfetch";
        s = "shuf";
        y = "yes";
        clock = "tty-clock";
        pps = "pipes.sh";
      };
    };

    # --- PROGRAMAS COM CONFIGURAÇÃO ---
    git = {
      enable = true;
      settings = {
        user.name = "naksdii";
        user.email = "seu-email@exemplo.com";
      };
    };

    # OBS Studio com plugins [cite: 31, 32]
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-vaapi
        obs-pipewire-audio-capture
        droidcam-obs
      ];
    };
  };

  # --- PACOTES DE USUÁRIO ---
  # Removidos do sistema e colocados aqui [cite: 36, 37, 38]
  home.packages = with pkgs; [
    # Ferramentas e Apps
    vivaldi
    telegram-desktop
    spotify
    discord
    vscode
    gimp
    anki
    kdePackages.okular
    easyeffects
    git

    # Terminais e CLI
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

    # Wayland / Hyprland UI
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

    # Customização e Estética
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

    # Desenvolvimento e Subsistemas
    clang-tools
    gcc
    gnumake
    nodejs
    sqlite
    jdk21
    curl

    # Matugen vindo do input do Flake [cite: 38]
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
