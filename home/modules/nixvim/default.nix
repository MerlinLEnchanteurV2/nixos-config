{...}:
{	
	programs.nixvim = {
		enable = true;
		viAlias = true;
  	vimAlias = true;
		defaultEditor = true;

		
			plugins.web-devicons.enable = true;
			plugins.which-key.enable = true;
			plugins.telescope = {
				enable = true;
				keymaps = {
					"<leader> " = { action = "find_files"; };
				};
			};
			plugins.neo-tree = {
				enable = true;
				window = {
					mappings = {
						"l" = "open";
						"h" = "close_node";
					};
				};
			};

			
			plugins.notify.enable = true;
			plugins.notify.topDown = false;
			plugins.notify.stages = "slide";
			plugins.notify.render = "minimal";
			
			plugins.noice.enable = true;

			# Code
			plugins.todo-comments.enable = true;
			plugins.indent-blankline.enable = true;

			plugins.lsp = {
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

			plugins.cmp = {
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
