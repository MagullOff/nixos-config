{ self, inputs, ... }: {
  flake.nixosModules.ssh = { lib, pkgs, config, ... }: {
    programs.ssh = {
      extraConfig = ''
        # Hufiec - website
        Host hufiec
            HostName s2.small.pl
            User rdmmst
        
        # Homelab
        Host homelab
            HostName 192.168.1.14
            User homelab
      '';
    };
  };
}


