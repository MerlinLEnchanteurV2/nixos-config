{pkgs, ...}:
{
	boot.loader.efi.canTouchEfiVariables = true;

	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		device = "nodev";
	};

	services.greetd = {
		enable = true;
		settings = { 
			default_session = {
				user = "merlin";
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet -c Hyprland --user-menu";
			};
		};
	};

	systemd.services.NetworkManager-wait-online.enable = false;
	systemd.services.dhcpcd.enable = false;
}
