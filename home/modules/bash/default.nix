{...}:
{
	programs.bash = {
		enable = true;
		enableCompletion = true;
		initExtra = "fastfetch";
		shellAliases = {
			"clean" = "sudo nix-collect-garbage && nix-collect-garbage -d";
			"hy" = "Hyprland";
			"x" = "exit";
		};
	};
}
