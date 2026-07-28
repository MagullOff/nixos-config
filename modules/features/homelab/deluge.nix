{ self, inputs, ... }: {
  flake.nixosModules.deluge = { config, pkgs, ... }: {
    services.deluge = {
      enable = true;
      web.enable = true;
      web.port = 8112;
      openFirewall = true; 
    };

    networking.firewall.allowedTCPPorts = [ 6881 ];
    networking.firewall.allowedUDPPorts = [ 6881 ];
  };
}
