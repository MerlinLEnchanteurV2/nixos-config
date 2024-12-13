{...}:
{
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];
	
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
  	trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


	imports = [
		../hardware-configuration.nix
		./boot.nix
		./display.nix
		./hardware.nix
		./localsettings.nix
		./network.nix
		./packages.nix
		./security.nix
		./users.nix
		#./virtual.nix
	];

	system.stateVersion = "24.05";
}
