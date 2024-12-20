{...}:
{
	services.hyprpaper = {
		enable = true;
		settings = {
			ipc = "on";
			splash = false;
			preload = [ "/etc/nixos/assets/jwst.png" ];
			wallpaper = [ ",/etc/nixos/assets/jwst.png" ];
		};
	};
}
