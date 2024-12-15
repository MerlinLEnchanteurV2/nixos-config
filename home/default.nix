{ nixvim, secrets, ... }:
{
	imports = [
		nixvim.homeManagerModules.nixvim
		./modules
		./packages.nix
	];

	home.username = "${secrets.username}";
	home.homeDirectory = "/home/${secrets.username}";
	home.stateVersion = "24.05";

	programs.home-manager.enable = true; 
}
