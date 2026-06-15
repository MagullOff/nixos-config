{ self, inputs, ... }: {
  flake.nixosModules.fastfetch = { lib, pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [
      fastfetch
    ];

    programs.bash.interactiveShellInit = ''
      fastfetch
    '';
  };
}


