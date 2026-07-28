{ self, inputs, ... }: {
  flake.nixosModules.radarr = { config, pkgs, ... }: {
    services.radarr = {
      enable = true;
      openFirewall = true; 
    };
  };
}
