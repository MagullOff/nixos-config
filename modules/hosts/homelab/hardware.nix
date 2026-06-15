{ self, inputs, ... }: {
  flake.nixosModules.homelabHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
       [ (modulesPath + "/installer/scan/not-detected.nix")
       ];

     boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
     boot.initrd.kernelModules = [ ];
     boot.kernelModules = [ "kvm-intel" ];
     boot.extraModulePackages = [ ];

     fileSystems."/" =
       { device = "/dev/disk/by-uuid/f5629193-1911-4c04-aa86-1209c8a3c276";
         fsType = "ext4";
       };

     fileSystems."/boot" =
       { device = "/dev/disk/by-uuid/6171-C1C9";
         fsType = "vfat";
         options = [ "fmask=0077" "dmask=0077" ];
       };

     swapDevices = [ ];

     nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
     hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
