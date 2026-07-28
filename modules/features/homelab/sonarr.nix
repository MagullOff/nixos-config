{ self, inputs, ... }: {
  flake.nixosModules.sonarr = { config, pkgs, ... }: {
    services.sonarr = {
      enable = true;
      openFirewall = true; 
    };
  };
}
