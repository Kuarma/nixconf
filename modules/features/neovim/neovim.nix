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

      settings.config_directory = ./.;

      runtimePkgs = with pkgs; [
        ffmpeg-full
        wl-clipboard
      ];

      specs.init = {
        data = null;
        before = ["MAIN_INIT"];
        config = "require('init')";
      };

      specs.plugins = {
	      data = with pkgs.vimPlugins; [
          nvim-treesitter-textobjects
          nvim-treesitter.withAllGrammars
          nvim-ts-autotag

          nvim-lspconfig
          lspkind-nvim

          blink-cmp
          blink-compat

          lz-n
          luasnip
          vim-tmux-navigator
          undotree
          oil-nvim
          plenary-nvim

          tokyonight-nvim
          nvim-web-devicons
          lualine-nvim
          colorful-menu-nvim
          snacks-nvim
	      ];
      };

      specs.lazyPlugins = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          nvim-autopairs
          gitsigns-nvim
          lazydev-nvim
          easy-dotnet-nvim
        ];
      };
    };
  };
}
