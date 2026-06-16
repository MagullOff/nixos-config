{ self, inputs, ... }: {
  flake.nixosModules.homepage = { config, pkgs, ... }: {

    services.homepage-dashboard = {
      enable = true;
      listenPort = 80; 
      
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
                href = "homelab:8096";
                description = "Mamy Netflix w domu";
              };
            }
            {
              "AdGuard" = {
                href = "homelab:3000";
                description = "Serwer DNS";
              };
            }
          ];
        }
        {
          "Custom Actions" = [
            {
              "Home Assistant" = {
                icon = "home-assistant.png";
                href = "http://homeassistant.local:8123";
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

    networking.firewall.allowedTCPPorts = [ 80 ];

  };
}
