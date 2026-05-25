{ self, inputs, ... }: {

  flake.nixosModules.git = { pkgs, lib, ... }: {
    programs.git = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.git-pkg;
    };
    programs.lazygit.enable = true;
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.git-pkg = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs; 
      settings = {
        init.defaultBranch = "master";
	core = {
	  autoSetupRemote = true;
	  fsmonitor = true; 
	};
	user = {
	  name = "Kuarma";
	  email = "mas.schibli@kuarma.com";
	};
	commit.gpgsign = true;
	gpg.format = "ssh";
      };
    };
  };
}
