# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  services.udev.extraRules = ''
    # Grant read/write permissions for hidraw devices to the 'input' group
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="input"
  '';

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  zramSwap.enable = true;
  networking.hostName = "mercury"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  #i18n.defaultLocale = "en_US.UTF-8";
  #console = {
  #  font = "Lat2-Terminus16";
  #  keyMap = "de-latin1";
  #  useXkbConfig = true; # use xkb.options in tty.
  #};

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];

 # hardware.nvidia = {

    # Modesetting is required.
    #modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    #powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    #powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    #open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    #nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    #prime = {
    #    intelBusId = "PCI:0:2:0";
    #    nvidiaBusId = "PCI:1:0:0";
    #};


#  };


  # Pen tablet support.
  services.xserver.digimend.enable = true;
  services.xserver.inputClassSections = [
    ''
      Identifier "XP-Pen Deco Pro MW"
      MatchUSBID "28bd:0934"
      MatchIsTablet "on"
      MatchDevicePath "/dev/input/event*"
      Driver "wacom"
    ''
    ''
      Identifier "XP-Pen Deco Pro MW"
      MatchUSBID "28bd:0934"
      MatchIsKeyboard "on"
      MatchDevicePath "/dev/input/event*"
      Driver "libinput"
    ''
  ];


  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
  };

  services.xserver.displayManager.lightdm = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";
  services.xserver.xkb.options = "eurosign:e,caps:escape,nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    cups-brother-hll2375dw
  ];
  
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #hardware.opentabletdriver = {
  #  enable = true;
  #  blacklistedKernelModules = [
  #    "hid-uclogic"
  #    "wacom"
  #  ];
  #};

  # required for opentabletdriver?
  #nixpkgs.config.permittedInsecurePackages = [
  #  "dotnet-runtime-wrapped-6.0.36"
  #  "dotnet-runtime-6.0.36"
  #  "dotnet-sdk-wrapped-6.0.428"
  #  "dotnet-sdk-6.0.428"
  #];


  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
 };
  
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = true;  # Disable touchpad during typing
      tapping = true;             # Enable tap-to-click
      #accelSpeed = "0.2";         # Adjust cursor acceleration (-1 to 1)
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wst = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];

  };

  programs = {
    #caja.enable = true;
    firefox.enable = true;
    light.enable = true;
    steam.enable = true;
    zsh.enable = true;
  };
  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    blueman
    bluez
    btop
    clang clang-tools
    dunst libnotify # notification daemon
    fd
    fzf
    gcc gdb
    git git-lfs github-cli
    i3status
    imagemagick
    inkscape
    jujutsu lazyjj
    killall
    libreoffice
    lshw
    mate.caja
    mupdf
    neovim
    go
    pango
    parallel
    poppler poppler_utils
    pciutils
    procps
    picom
    prismlauncher # minecraft
    (pkgs.python3.withPackages (ps: with ps; [
      numpy
      typer
    ]))
    rclone
    redshift
    ripgrep
    rofi
    scrot
    silver-searcher
    sxiv
    texlive.combined.scheme-full 
    tldr
    unrar
    usbutils
    vim 
    wget
    wireplumber
    xclip
    zip unzip
    zoxide
    krita
  ];


  fonts.packages = with pkgs; [
    cozette
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

