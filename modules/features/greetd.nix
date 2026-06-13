{
  ...
}:
{
  flake.nixosModules.greetd =
    {
      pkgs,
      ...
    }:
    {
      users.users.greeter.extraGroups = [
        "video"
        "input"
      ];

      services.greetd = {
        enable = true;
      };

      programs.regreet = {
        enable = true;
        settings = {
          GTK.application_prefer_dark_theme = true;
          fit = "Cover";
        };
        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
      };
    };
}
