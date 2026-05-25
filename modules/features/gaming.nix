{ self, inputs, ... }: {

  flake.nixosModules.gaming = { pkgs, lib, ... }: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
	protontricks.enable = true;
      };
    }; 

    environment.systemPackages = with pkgs; [
      steam-run
      dxvk
      lsfg-vk
      lsfg-vk-ui
      gamescope
      mangohud
      er-patcher
      steamtinkerlaunch
    ];
  
    nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };

    # star citizen
  };
}
