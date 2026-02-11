{
  config,
  ...
}:

let 
pamLoginLimits = {
  domain = "*";
  item = "nofile";
  value= "524288";
};
in

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  swapDevices = [ { device = "/dev/nvme0n1p3"; priority = 10;}  ];
  zramSwap = { 
    enable = true;
    priority = 50;
  };
  networking = {
    hostName = "nixos";
    firewall.enable = false;
    networkmanager.enable = true;
  };
  
  security={
    rtkit.enable = true;
    pam.loginLimits = [
      (pamLoginLimits // {type = "soft";})
      (pamLoginLimits // {type = "hard";})
    ];
  };
 system.stateVersion = "25.11";
}
