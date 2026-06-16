{ self, inputs, ... }: {
  flake.nixosModules.adguard = { config, pkgs, ... }: {

    services.adguardhome = {
      enable = true;
      openFirewall = true; 
    };

    services.resolved.enable = false;

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 3000 53 ];
      allowedUDPPorts = [ 53 ];
    };
  };
}
