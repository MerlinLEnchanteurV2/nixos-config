{pkgs, lib, ...}:
let secrets = import ../secrets.nix;
in
{
	boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-cf8d4b22-6e21-4c3b-a3a7-8ee5b50fe1d5".device = "/dev/disk/by-uuid/cf8d4b22-6e21-4c3b-a3a7-8ee5b50fe1d5";

	services.greetd = {
		enable = true;
		settings = { 
			default_session = {
				user = "${secrets.username}";
				command = "${lib.getExe pkgs.fastfetch} && bash"; #"${pkgs.greetd.tuigreet}/bin/tuigreet -c Hyprland --user-menu";
			};
		};
	};

	systemd.services.NetworkManager-wait-online.enable = false;
	systemd.services.dhcpcd.enable = false;
}
