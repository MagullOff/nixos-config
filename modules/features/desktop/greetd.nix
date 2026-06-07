{ self, inputs, ... }: {
  flake.nixosModules.greetd = {pkgs, lib, ... }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
          user = "greeter";
        };
      };
    };

    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal"; 
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };

    environment.systemPackages = with pkgs; [
      tuigreet
    ];
  };
}
