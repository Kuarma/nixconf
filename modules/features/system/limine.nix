{
  ...
}:
{
  flake.nixosModules.limine =
    {
      pkgs,
      ...
    }:
    {
      boot = {
        plymouth.enable = true;
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          limine = {
            enable = true;
            secureBoot = {
              enable = true;
              autoEnrollKeys.enable = true;
              autoGenerateKeys = true;
            };
          };
          efi.canTouchEfiVariables = true;
        };
      };
    };
}
