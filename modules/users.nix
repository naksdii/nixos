{
  inputs,
  pkgs,
  ...
}:

{
  users.users.naksdii = {
    isNormalUser = true;
    description = "naksdii";
    shell = pkgs.zsh;

    extraGroups = [
      "wheel"
     "audio"
      
    ];
  };
}

