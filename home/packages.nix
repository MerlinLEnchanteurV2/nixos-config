{pkgs, ...}:
{
	home.packages = with pkgs; [
		keepassxc
		rustup
		gcc
	];

	programs.bash = {
		enable = true;
		enableCompletion = true; 
		shellAliases = {
			"clean" = "sudo nix-collect-garbage && nix-collect-garbage -d";
		};
	};

	programs.firefox.enable = true;
}
