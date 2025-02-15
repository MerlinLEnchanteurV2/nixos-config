{nixvim, pkgs, ...}:
{
	imports = [
		nixvim.homeManagerModules.nixvim
	];
	programs.nixvim = {
		enable = true;
		viAlias = true;
  	vimAlias = true;
		defaultEditor = true;
		
		plugins = {
			lualine.enable = true;
			web-devicons.enable = true;
			which-key.enable = true;
			telescope = {
				enable = true;
				keymaps = {
					"<leader> " = {
						action = "find_files";
					};
				};
			};
			neo-tree = {
				enable = true;
				window = {
					mappings = {
						"l" = "open";
						"h" = "close_node";
					};
				};
			};
			notify = {
				enable = true;
				settings = {
					top_down = false;
					stages = "slide";
					render = "minimal";
				};
			};
			noice.enable = true;
			todo-comments.enable = true;
			indent-blankline.enable = true;
			treesitter = {
				enable = true;
				settings.highlight.enable = true;
				settings.autoinstall.enable = true;	
			};
			lsp = {
				enable = true;
				servers = {
					ts_ls.enable=true;
					html.enable = true;
					pylsp.enable = true;
					svelte.enable = true;
					nil_ls.enable = true;
					clangd.enable = true;
					rust_analyzer = {
						enable = true;
						installRustc = false;
						installCargo = false;
					};
				};
				keymaps = {
					lspBuf = {
						"K" = { action = "hover"; };
						"<leader>ca" = { action = "code_action"; };
					};
				};
			};
			cmp = {
				enable = true;
				autoEnableSources = true;
				settings = {
					sources = [
						{ name = "nvim_lsp"; }
						{ name = "path"; }
						{ name = "buffer"; }
					];
					mapping = {
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-e>" = "cmp.mapping.close()";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<Tab>" = "cmp.mapping.confirm({ select = true })";
						"K" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
						"J" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
					};
				};
			};
		};

		keymaps = [
			{
				mode = "n";
				key = "<leader>e";
				action = "<cmd>Neotree<CR>";
			}
			{
				mode = "n";
				key = "mf";
				action = "<cmd>lua vim.lsp.buf.format()<CR>";
			}
			{
				mode = "n";
				key = "mr";
				action = "<cmd>lua vim.lsp.buf.rename()<CR>";
			}
	];
	
		opts = {
			tabstop = 2;
			shiftwidth = 2;
			number = true;
			relativenumber = true;
		};

		globals.mapleader = " ";
		clipboard.providers.wl-copy.enable = true;
		clipboard.register = "unnamedplus";
		colorschemes.onedark.enable = true;
	};
}
