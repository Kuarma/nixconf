{ self, inputs, ... }: {

  flake.nixosModules.neovim = { pkgs, lib, ... }: {
    programs.neovim = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.nvim-pkg;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.nvim-pkg = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs; 
      settings = {
        
      };
    };
  };
}
