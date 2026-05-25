{ self, inputs, ... }: {

    flake.nixosModules.lunasConfiguration = { config, pkgs, lib, ... }: {

    imports = [
      self.nixosModules.lunasHardware # most of them are default
      self.nixosModules.niri
      self.nixosModules.neovim
      self.nixosModules.kitty
      self.nixosModules.brave
      self.nixosModules.gaming
      self.nixosModules.discord
      self.nixosModules.git
      self.nixosModules.tmux
      self.nixosModules.swaylock
      inputs.home-manager.nixosModules.home-manager
    ];

    networking.hostName = "lunix"; # stay

    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # default

    # Disko with btrfs

    boot.loader = { # default
      limine = {
        enable = true;
	secureBoot.autoGenerateKeys = true;
	secureBoot.enable = true;
	secureBoot.autoEnrollKeys.enable = true;
      };
      efi.canTouchEfiVariables = true;
    };

    networking.networkmanager.enable = true; # default

    services.xserver.videoDrivers = [ "nvidia" ]; # nvidia module

    boot = { # nvidia 
      blacklistedKernelModules = [ "nouveau" ];
      kernelParams = [ "nvidia-drm.modeset=1" "loglevel=3" ];
    };

    hardware.nvidia = { # nvidia
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.graphics.enable = true; 

    time.timeZone = "Europe/Zurich"; # stay 

    i18n = {
      defaultLocale = "en_US.UTF-8";

      extraLocaleSettings = {
        LC_ADDRESS = "de_CH.UTF-8";
        LC_IDENTIFICATION = "de_CH.UTF-8";
        LC_MEASUREMENT = "de_CH.UTF-8";
        LC_MONETARY = "de_CH.UTF-8";
        LC_NAME = "de_CH.UTF-8";
        LC_NUMERIC = "de_CH.UTF-8";
        LC_PAPER = "de_CH.UTF-8";
        LC_TELEPHONE = "de_CH.UTF-8";
        LC_TIME = "de_CH.UTF-8";
      };
    };

    console.keyMap = "sg"; # stay

    security.rtkit.enable = true; # stay

    services.pipewire = { # stay
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    users.users.luna = { # stay
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };

    environment.systemPackages = with pkgs; [
      wget # default
      unzip
    ];

    nixpkgs.config.allowUnfree = true; # nvidia??

    system.stateVersion = "25.11"; # stay
  };
}
