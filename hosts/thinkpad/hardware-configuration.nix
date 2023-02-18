# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.systemd.enable = true;
  boot.initrd.luks.devices."luksroot" = {
    device = "/dev/disk/by-uuid/6b89181c-71e0-4e84-8523-2456d3e28400";
    allowDiscards = true;
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/3d44cde5-17a2-4023-b9ae-3a02ae68aa81";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "discard=async" "noatime" ];
    };


  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/3d44cde5-17a2-4023-b9ae-3a02ae68aa81";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "discard=async" "noatime" ];
    };

  fileSystems."/var/lib" =
    {
      device = "/dev/disk/by-uuid/3d44cde5-17a2-4023-b9ae-3a02ae68aa81";
      fsType = "btrfs";
      options = [ "subvol=lib" "compress=zstd" "discard=async" "noatime" ];
    };

  fileSystems."/var/log" =
    {
      device = "/dev/disk/by-uuid/3d44cde5-17a2-4023-b9ae-3a02ae68aa81";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "discard=async" "noatime" ];
    };

  fileSystems."/nix/store" =
    {
      device = "/dev/disk/by-uuid/3d44cde5-17a2-4023-b9ae-3a02ae68aa81";
      fsType = "btrfs";
      options = [ "subvol=store" "compress=zstd" "discard=async" "noatime" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/B174-4DAE";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
