{ self, inputs, ... }: {

  flake.nixosModules.homelabConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.homelabHardware
      self.nixosModules.core
      self.nixosModules.homelab
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixos"; 

    users.users.homelab = {
      isNormalUser = true;
      description = "homelab";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
    time.timeZone = "Europe/Warsaw";

    virtualisation.docker.enable = true;

    networking.firewall.allowedTCPPorts = [
      8080 # qBittorrent Web UI
      8989 # Sonarr
      7878 # Radarr
      8787 # Readarr
      9696 # Prowlarr
      8191 # Flaresolverr
    ];

  };

}
