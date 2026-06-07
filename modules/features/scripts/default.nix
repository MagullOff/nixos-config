{ self, inputs, ... }: {
  flake.nixosModules.scripts = { pkgs, config, ... }: {
    environment.etc = {
      "emoji-launcher.sh" = {
        text = builtins.readFile ./emoji-launcher.sh;
        mode = "0755";
      };
      "screenshot.sh" = {
        text = builtins.readFile ./screenshot.sh;
        mode = "0755";
      };
      "rofi-launcher.sh" = {
        text = builtins.readFile ./rofi-launcher.sh;
        mode = "0755";
      };
      "messenger-launcher.sh" = {
        text = builtins.readFile ./messenger-launcher.sh;
        mode = "0755";
      };
      "whatsapp-launcher.sh" = {
        text = builtins.readFile ./whatsapp-launcher.sh;
        mode = "0755";
      };
      "sync-dotfiles.sh" = {
        text = builtins.readFile ./sync-dotfiles.sh;
        mode = "0755";
      };
    };
  };
}

