# Você não tá usando a variavel 'config'
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  environment.systemPackages = with pkgs; [
    waybar
    kitty
    rofi
    swww
    firefox
    vlc
    discord
    nautilus
    btop
    git
    mako
    libnotify
    matugen
    pavucontrol
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
  networking.hostName = "nixos";

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
  };
  console.keyMap = "br-abnt2";

  users.users.vinicius = {
    isNormalUser = true;
    description = "vinicius";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # Não precisa explicitar se o valor é null
  };
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  system.stateVersion = "25.11";
}
