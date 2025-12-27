# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # what the heck are you looking here
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

  #Hyprland 
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  #XDG portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  

  #so lost, i'm faded
  environment.systemPackages = [
    pkgs.waybar
    pkgs.kitty
    pkgs.rofi
    pkgs.swww
    pkgs.firefox
    pkgs.vlc
    pkgs.discord
    pkgs.nautilus
    pkgs.btop
    pkgs.git
    pkgs.mako
    pkgs.libnotify
    pkgs.matugen
    pkgs.pavucontrol
  ];



  # Audio 
  security.rtkit.enable = true;
  services.pipewire = {
   enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };

  
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";

  users.users.vinicius = {
    isNormalUser = true;
    description = "vinicius";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
  nix =  {
    settings.experimental-features = ["nix-command" "flakes"];
  };
  system.stateVersion = "25.11"; # Did you read the comment?
}
