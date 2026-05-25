{ self, inputs, ... }: {

  flake.nixosModules.brave = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      brave
    ];

    programs.chromium.enable = true;
  };
}
