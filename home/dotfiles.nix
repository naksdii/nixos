{ ... }:
{
  xdg.configFile = {

    "fastfetch".source = ./dotfiles/fastfetch;
    "matugen".source = ./dotfiles/matugen;
    "swaync".source = ./dotfiles/swaync;
    "kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

    ########
    #waybar#
    ########
    "waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
    "waybar/style.css".source = ./dotfiles/waybar/style.css;
    "waybar/modules.json".source = ./dotfiles/waybar/modules.json;
    
    ######
    #rofi#
    ######
    "rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    "rofi/themes/round.rasi".source = ./dotfiles/rofi/themes/config.rasi;

    ########################
    #single archive configs#
    ########################
    "helix/config.toml".source = ./dotfiles/helix/config.toml;
    "cava/config".source = ./dotfiles/cava/config;
    "hyfetch.json".source = ./dotfiles/hyfetch.json;
  };
}
