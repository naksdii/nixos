{ pkgs, inputs, ... }: {
  home.username = "naksdii";
  home.homeDirectory = "/home/naksdii";
  home.stateVersion = "25.11"; # Use a mesma versão do seu sistema

  programs.home-manager.enable = true;

  # Exemplo: usar o matugen que veio do flake
  # home.packages = [ inputs.matugen.packages.${pkgs.system}.default ];

  # Suas configurações de programas aqui...
}