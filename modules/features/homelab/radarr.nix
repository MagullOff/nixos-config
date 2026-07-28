{ self, inputs, ... }: {
  flake.nixosModules.radarr = { config, pkgs, ... }: {
    services.radarr = {
      enable = true;
      openFirewall = true; 
    };

    networking.firewall.allowedTCPPorts = [ 7878 ];
  };
}
