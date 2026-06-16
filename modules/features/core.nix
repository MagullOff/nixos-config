{ self, inputs, ... }: {
  flake.nixosModules.core = {pkgs, lib, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [ "electron-36.9.5" ];

    networking.networkmanager.enable = true;

    services.xserver.xkb = {
      layout = "pl";
      variant = "";
    };
    console.keyMap = "pl2";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_IDENTIFICATION = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };

    environment.systemPackages = with pkgs; [
      neovim gcc R git tmux wget ripgrep bottom python3 nodejs grim
      git-credential-manager ranger w3m ueberzugpp highlight bat gdu
      atool ffmpegthumbnailer mediainfo poppler-utils odt2txt pass
      catimg chafa exiftool lazygit docker docker-compose gnupg makeWrapper
      fastfetch
    ];

    programs.bash.interactiveShellInit = ''
      fastfetch
    '';
  };
}
