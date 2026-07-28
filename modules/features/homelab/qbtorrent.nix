{ self, inputs, ... }: {
  flake.nixosModules.qbtorrent = { config, pkgs, ... }: {
    services.qbittorrent = {
      enable = true;
      openFirewall = true;
      
      serverConfig = {
        Preferences = {
          WebUI = {
            ServerDomains = "homelab; homelab.local";
          };
        };
      };
    };
  };
}
