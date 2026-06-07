{ self, inputs, ... }: {
  flake.nixosModules.audio = {pkgs, lib, ... }: {
    services.pipewire.enable = false;

    hardware.alsa.enable = true;

    services.pulseaudio = {
      enable = lib.mkForce true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
