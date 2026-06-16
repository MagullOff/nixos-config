{ self, inputs, ... }: {
  flake.nixosModules.homelab = {pkgs, lib, ... }: {
    imports = [
      self.nixosModules.jellyfin
      self.nixosModules.openssh
      self.nixosModules.adguard
      self.nixosModules.homepage
    ];
  };
}
