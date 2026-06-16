{ self, inputs, ... }: {
  flake.nixosModules.jellyfin = { config, pkgs, ... }:
  {
    services.jellyfin = {
      enable = true;
      openFirewall = true; # Automatically opens port 8096 for your local network
    };

    environment.systemPackages = [
      pkgs.jellyfin
      pkgs.jellyfin-web
      pkgs.jellyfin-ffmpeg
    ];
  };
}
