{ config, pkgs, ... }:

{
  xdg.configFile = {
    #########
    # FOLDERS (Cópia Recursiva)
    #########
    # Ao usar 'source' em uma pasta e não definir nada extra, o Nix costuma linkar a pasta.
    # Se quiser que os arquivos dentro sejam editáveis, o Nix ainda vai tentar protegê-los.
    "fastfetch".source = ./dotfiles/fastfetch;
    "matugen".source = ./dotfiles/matugen;

    ########
    # ARQUIVOS (Passando o conteúdo)
    ########
    "waybar/config.jsonc".text = builtins.readFile ./dotfiles/waybar/config.jsonc;
    "waybar/style.css".text    = builtins.readFile ./dotfiles/waybar/style.css;
    "waybar/modules.json".text = builtins.readFile ./dotfiles/waybar/modules.json;

    "swaync/config.json".text  = builtins.readFile ./dotfiles/swaync/config.json;
    "swaync/style.css".text   = builtins.readFile ./dotfiles/swaync/style.css;

    "rofi/config.rasi".text    = builtins.readFile ./dotfiles/rofi/config.rasi;
    "rofi/themes/round.rasi".text = builtins.readFile ./dotfiles/rofi/themes/round.rasi;

    "kitty/kitty.conf".text    = builtins.readFile ./dotfiles/kitty/kitty.conf;
    "helix/config.toml".text   = builtins.readFile ./dotfiles/helix/config.toml;
    "cava/config".text        = builtins.readFile ./dotfiles/cava/config;
    "hyfetch.json".text       = builtins.readFile ./dotfiles/hyfetch.json;
  };
}
