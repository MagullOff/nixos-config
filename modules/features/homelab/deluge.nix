{ self, inputs, ... }: {
  flake.nixosModules.deluge = { config, pkgs, ... }: {
    services.deluge = {
      enable = true;
      openFirewall = true; 
    };
  };
}
