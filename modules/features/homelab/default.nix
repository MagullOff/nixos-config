{ self, inputs, ... }: {
  flake.nixosModules.homelab = {pkgs, lib, ... }: {
    imports = [
      self.nixosModules.jellyfin
      self.nixosModules.openssh
      self.nixosModules.adguard
      self.nixosModules.homepage
      self.nixosModules.prowlarr
      self.nixosModules.radarr
      self.nixosModules.sonarr
      self.nixosModules.readarr
      self.nixosModules.flaresolverr
      self.nixosModules.deluge
    ];
  };
}
