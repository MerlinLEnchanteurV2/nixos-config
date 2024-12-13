{	
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		# home-manager, used for managing user configuration
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};	

	outputs = inputs@{ nixpkgs, home-manager, nixvim,... }: 
	let secrets = import ./secrets.nix; in
	{
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem { 
				system = "x86_64-linux";
				modules = [
					./config/config.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.extraSpecialArgs = { inherit inputs; inherit nixvim; inherit secrets; };
						home-manager.users.${secrets.username} = import ./home/home.nix;
					}
				];
			};
		};
	};
}
