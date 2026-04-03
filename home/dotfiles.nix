{ ... }:
{
  xdg.configFile = {
    #########
    #folders#
    #########
    "fastfetch".source = ./dotfiles/fastfetch;
    "matugen".source = ./dotfiles/matugen;

    ########
    #waybar#
    ########
    "waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
    "waybar/style.css".source = ./dotfiles/waybar/style.css;
    "waybar/modules.json".source = ./dotfiles/waybar/modules.json;

    ########
    #swaync#
    ########
    "swaync/config.json".source = ./dotfiles/swaync/config.json;
    "swaync/style.css".source = ./dotfiles/swaync/style.css;

    ######
    #rofi#
    ######
    "rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    "rofi/themes/round.rasi".source = ./dotfiles/rofi/themes/round.rasi;


    ########################
    #single archive configs#
    ########################
    "kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;
    "helix/config.toml".source = ./dotfiles/helix/config.toml;
    "cava/config".source = ./dotfiles/cava/config;
    "hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
