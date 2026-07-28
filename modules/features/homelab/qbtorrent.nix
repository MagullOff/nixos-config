{ self, inputs, ... }: {
  flake.nixosModules.radarr = { config, pkgs, ... }: {
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
