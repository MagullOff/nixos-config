{ self, inputs, ... }: {
  flake.nixosModules.adguard = { config, pkgs, ... }:
  {

    services.adguardhome = {
      enable = true;
      openFirewall = true;
      settings = {
        http = {
          address = "0.0.0.0:3000";
        };
        dns = {
          bind_hosts = [ "0.0.0.0" ];
          port = 53;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 3000 ];

  };
}
