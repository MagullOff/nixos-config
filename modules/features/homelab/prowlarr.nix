{ self, inputs, ... }: {
  flake.nixosModules.prowlarr = { config, pkgs, ... }: {
    services.prowlarr = {
      enable = true;
      openFirewall = true; 
    };
  };
}
