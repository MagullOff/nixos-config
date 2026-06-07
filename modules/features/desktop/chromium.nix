{ self, inputs, ... }: {
  flake.nixosModules.chromium = {pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      chromium
    ];
  };
}
