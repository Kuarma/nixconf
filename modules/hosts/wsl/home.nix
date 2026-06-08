{ self, inputs, ... }: {

  flake.homeModules.wslModule = { pkgs, ... }: {

    imports = [ 
    ]; 

    home.enableNixpkgsReleaseCheck = false;

    home.stateVersion = "26.05";
  };
}
