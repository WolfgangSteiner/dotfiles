{ pkgs, modulesPath, ... }: {
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];

  nixpkgs.hostPlatform = "x86_64-linux";

  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  environment.systemPackages = with pkgs; [
    neovim
    git
    networkmanager
    parted
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.wireless.enable = true;
  networking.wireless.networks = {
    AuroraBorealis = { psk = "70628315029956057259"; };
  };
}
