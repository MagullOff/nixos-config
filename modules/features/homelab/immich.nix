{ self, inputs, ... }: {
  flake.nixosModules.immich = { config, pkgs, ... }: {
    services.immich = {
      enable = true;
      port = 2283;
      host = "0.0.0.0";
      openFirewall = true;
      mediaLocation = "/var/lib/immich";
      allowedHosts = "homelab:2283,localhost:2283,127.0.0.1:2283,192.168.1.14:2283";
    };
  };
}
