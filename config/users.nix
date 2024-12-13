let secrets = import ../secrets.nix; in
{...}:
{
	users.users.${secrets.username} = {
		isNormalUser = true;
		description = "${secrets.userdescription}";
		extraGroups = [
			"networkmanager"
			"wheel"
		];
		packages = [];
	};
}

