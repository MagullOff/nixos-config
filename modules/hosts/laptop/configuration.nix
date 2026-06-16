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
    time.timeZone = "Europe/Warsaw";

    virtualisation.docker.enable = true;
    networking.nameservers = [ "192.168.1.14" ];
    networking.networkmanager.insertNameservers = [ "192.168.1.14" ];

    system.stateVersion = "25.05";
  };

}
