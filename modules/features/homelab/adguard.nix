{ self, inputs, ... }: {
  flake.nixosModules.adguard = { config, pkgs, ... }: {

    services.adguardhome = {
      enable = true;
      openFirewall = true;
    };

    services.resolved.settings = {
      Resolve = {
        DNSStubListener = "no";
      };
    };

    networking.firewall.allowedTCPPorts = [ 3000 80 ];
  };
}
