{ self, inputs, lib, ... }: {
  flake.nixosModules.homepage = { config, pkgs, ... }: {

    services.homepage-dashboard = {
      enable = true;
      listenPort = 8082;

      allowedHosts = "homelab:8082,localhost:8082,127.0.0.1:8082,192.168.1.14:8082";

      widgets = [
        {
          resources = {
            cpu = true;
            memory = true; 
            disk = "/";
          };
        }
      ];

      services = [
        {
          "Serwisy" = [
            {
              "Jellyfin" = {
                href = "http://homelab:8096"; 
                description = "Mamy Netflix w domu";
              };
            }
            {
              "AdGuard" = {
                href = "http://homelab:3000";
                description = "Serwer DNS";
              };
            }
          ];
          "Arrrr" = [
            {
              "qBittorent" = {
                href = "http://homelab:8080"; 
              };
            }
            {
              "Sonarr" = {
                href = "http://homelab:8989";
              };
            }
            {
              "Radarr" = {
                href = "http://homelab:7878";
              };
            }
            {
              "Readarr" = {
                href = "http://homelab:8787";
              };
            }
            {
              "Prowlarr" = {
                href = "http://homelab:9696";
              };
            }
          ];
        }
      ];

      settings = {
        title = "Dashboard";
      };
    };

    networking.firewall.allowedTCPPorts = [ 8082 8080 ];

  };
}
