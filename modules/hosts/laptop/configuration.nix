{ self, inputs, ... }: {

  flake.nixosModules.laptopConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.laptopHardware
      self.nixosModules.core
      self.nixosModules.desktop
      self.nixosModules.scripts
      self.nixosModules.ssh
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixos"; 

    users.users.magulloff = {
      isNormalUser = true;
      description = "magulloff";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };

    virtualisation.docker.enable = true;

    system.stateVersion = "25.05";
  };

}
