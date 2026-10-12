{ self, inputs, ... }: {
  flake.nixosModules.immich = { config, pkgs, ... }: {
    services.immich = {
      enable = true;
      port = 2283;
      host = "0.0.0.0"; # Makes it accessible across your local network
      openFirewall = true; # Automatically opens the port in firewall
      mediaLocation = "/var/lib/immich"; # Default directory for stored media
    };
  };
}
