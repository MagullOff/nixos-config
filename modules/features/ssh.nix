{ self, inputs, ... }: {
  flake.nixosModules.ssh = { lib, pkgs, config, ... }: {
    programs.ssh = {
      extraConfig = ''
        # Hufiec - website
        Host hufiec
            HostName s2.small.pl
            User rdmmst
        
        # Future connections can be appended here
        # Host pi-server
        #     HostName 192.168.1.50
        #     User root
      '';
    };
  };
}


