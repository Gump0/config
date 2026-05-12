# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # exclude kde packages that I don't use
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
	dolphin
	konsole
	kate
	okular
	khelpcenter
  ];

  # exclude xterm
  services.xserver.excludePackages = with pkgs; [
  	xterm
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gb = {
    isNormalUser = true;
    description = "Gleb Belyakov";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable firmware updates
  services.fwupd.enable = true;

  # amd cpu microcode updates
  hardware.cpu.amd.updateMicrocode = true;

  # optimizations for gaming
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.nix-ld.enable = true;

  # graphics stack
  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	# essentials
	pkgs.home-manager
	pkgs.neovim
	git
	pkgs.gh
	wget
	curl
	kitty
	xfce.thunar
	tree
	pkgs.bitwarden-desktop
	pkgs.ripgrep
	pkgs.unzip
	pkgs.nodejs
	# browsers (palemoon as default)
	pkgs.palemoon-bin
	pkgs.firefox
	# gaming
	lutris
	pkgs.steam
	pkgs.discord
	# unity
	pkgs.unityhub
	# developer packages
	dotnet-sdk
	mono
	clang
	cmake
	# vulkan/amd packages
	vulkan-tools
	mesa-demos
	# ricing stuff
	pkgs.papirus-icon-theme
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.neovim = {
	enable = true;
	vimAlias = true;
  };
 
  # Set default applications  
  environment.sessionVariables = {
  TERMINAL = "kitty";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
