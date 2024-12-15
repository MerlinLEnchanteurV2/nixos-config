{...}:
{
  programs.kitty = {
		enable=true;
		keybindings = {
			"ctrl+c" = "copy_or_interrupt";
			"ctrl+enter" = "new_tab";
			"ctrl+right" = "next_tab";
			"ctrl+left" = "previous_tab";
			"ctrl+q" = "close_tab";
			"ctrl+&" = "goto_tab 1";
			"ctrl+é" = "goto_tab 2";
			"ctrl+\"" = "goto_tab 3";
			"ctrl+'" = "goto_tab 4";
			"ctrl+(" = "goto_tab 5";
			"ctrl+-" = "goto_tab 6";
			"ctrl+è" = "goto_tab 7";
			"ctrl+_" = "goto_tab 8";
			"ctrl+ç" = "goto_tab 9";
			"alt+c" = "launch --cwd=current --type=tab sudo -E nvim /etc/nixos";
			"alt+space" = "launch --cwd=current --type=tab nvim";
			"alt+shift+space" = "launch --cwd=current --type=tab sudo -E nvim";
			"alt+u" = "launch sh -c \"sudo nixos-rebuild switch --flake path:///etc/nixos/ && sleep 5\"";
		};
		font.size = 13;
		font.name = "DejaVu Sans";
		settings = {
			background_opacity = 0.75;
		};
	};
}
