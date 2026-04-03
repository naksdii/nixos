{ pkgs, ... }:
{
  programs.zsh = {
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
}
