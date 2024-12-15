{...}:
{	
	programs.nixvim = {
		enable = true;
		viAlias = true;
  	vimAlias = true;
		defaultEditor = true;

		plugins = {
			web-devicons.enable = true;
			which-key.enable = true;
			telescope = {
				enable = true;
				keymaps = {
					"<leader> " = { action = "find_files"; };
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
				topDown = false;
				stages = "slide";
				render = "minimal";
			};
			noice.enable = true;

			# Code
			todo-comments.enable = true;
			indent-blankline.enable = true;

			lsp = {
				enable = true;
				servers = {
					nil_ls.enable = true;
					rust_analyzer.enable = true;
					rust_analyzer.installRustc = false;
					rust_analyzer.installCargo = false;
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
						"<down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
						"<up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
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
	};
}
