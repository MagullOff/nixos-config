{ self, inputs, ... }: {
  flake.nixosModules.flaresolverr = { config, pkgs, ... }:
  {
    services.flaresolverr = {
      enable = true;
      openFirewall = true; 
    };
  };
}
