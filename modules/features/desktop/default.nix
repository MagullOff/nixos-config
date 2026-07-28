{ self, inputs, ... }: {
  flake.nixosModules.desktop = {pkgs, lib, ... }: {
    imports = [
      self.nixosModules.hyprland
      self.nixosModules.greetd
      self.nixosModules.audio
      self.nixosModules.kitty
      self.nixosModules.chromium
      self.nixosModules.zen
    ];

    fonts.packages = with pkgs; [ 
      nerd-fonts.fira-code 
    ];
  };
}
