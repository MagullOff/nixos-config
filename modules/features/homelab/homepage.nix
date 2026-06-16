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
        }
      ];

      settings = {
        title = "Dashboard";
        background = {
          image = "https://media.sketchfab.com/models/57bf206367214ff48d20e179c539e953/thumbnails/52fa37b473e74db190ea64c2108a607f/375663e0738d4a7985ed5ba9e4dc5f83.jpeg"; 
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 8082 ];

  };
}
