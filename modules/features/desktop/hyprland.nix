{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, lib, ... }: {
    programs.hyprland = {
      enable = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      GCM_CREDENTIAL_STORE = "plaintext";
    };
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    security.rtkit.enable = true;

    environment.systemPackages = with pkgs; [
      hyprlock
      wl-clipboard
      awww
      swappy
      rofi
      waybar
      dunst
      libnotify
      brightnessctl
      wtype
      slurp
    ];
  };
}

