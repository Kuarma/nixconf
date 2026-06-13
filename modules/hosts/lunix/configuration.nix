{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.lunaConfiguration =
    {
      ...
    }:
    {
      imports = [
        inputs.home-manager.nixosModules.default

        # System
        self.nixosModules.nix
        self.nixosModules.nvidia
        self.nixosModules.limine
        self.nixosModules.pipewire

        self.nixosModules.greetd
        self.nixosModules.niri
        self.nixosModules.neovim
        self.nixosModules.kitty
        self.nixosModules.fastfetch
        self.nixosModules.librewolf
        self.nixosModules.gaming
        self.nixosModules.git
        self.nixosModules.tmux
        self.nixosModules.mullvad
      ];

      services.upower.enable = true;

      networking = {
        firewall.enable = true;
        networkmanager.enable = true;
        hostName = "lunix";
      };

      time.timeZone = "Europe/Zurich";

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

      console.keyMap = "sg";

      services.xserver.xkb.layout = "ch";

      users.users.luna = {
        isNormalUser = true;
        initialPassword = "changeme";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      home-manager = {
        users.luna = self.homeModules.lunaModule;
        useGlobalPkgs = true;
        useUserPackages = true;
        overwriteBackup = true;
        backupFileExtension = "backup";
      };

      system.stateVersion = "25.11";
    };
}
