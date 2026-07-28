{ self, inputs, ... }: {
  flake.nixosModules.readarr = { config, pkgs, ... }: {
    services.readarr = {
      enable = true;
      openFirewall = true; 
    };
  };
}
