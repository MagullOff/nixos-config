{ self, inputs, ... }: {
  flake.nixosModules.radarr = { config, pkgs, ... }: {
    services.qbittorrent = {
      enable = true;
      openFirewall = true; # Opens the webuiPort and torrentingPort in systemd firewall
      webuiPort = 8087;    # Default is 8080
    };
  };
}
