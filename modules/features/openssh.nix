{ self, inputs, ... }: {
  flake.nixosModules.openssh = { config, pkgs, ... }:
  {

    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "homelab" ];
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

  };
}
