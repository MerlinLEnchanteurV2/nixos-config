{inputs, pkgs, lib, ...}:
{	
	wayland.windowManager.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
	};

	imports = [
		./waybar.nix
	];
	wayland.windowManager.hyprland.settings = {
		"$mod" = "SUPER";
		"$BROWSER" = "firefox";

		animation = [
			"workspaces, 1, 2, default"
			"windows, 1, 2, default"
		];

		input = {
			kb_layout = "fr";
		};

		monitor = ",preferred, auto, 1";

		env = [
			"HYPRCURSORSIZE, 32"
		];

		exec-once = [
			"waybar"
		];

		bind = [
			"$mod, Return, exec, kitty"
			"$mod, B, exec, $BROWSER"
			"$mod, space, exec, $BROWSER https://mynixos.com"

			"$mod, Backspace, killactive"
			"$mod SHIFT, Escape, togglefloating"
			"$mod, Escape, fullscreen" 

			",XF86MonBrightnessDown, exec, ${lib.getExe pkgs.brightnessctl} set 1%-"
			",XF86MonBrightnessUp, exec, ${lib.getExe pkgs.brightnessctl} set 1%+"

			"$mod SHIFT, H, exec, systemctl hibernate && hyprlock"
		] ++ (
			builtins.concatLists (builtins.genList (i:
				let ws = i + 1;
				in [
					"$mod, code:1${toString i}, workspace, ${toString ws}"
					"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
				])
			9)
		);
		
		binds = "Super_L&Shift_L, S, exec, ${lib.getExe pkgs.grim} -g \"$(${lib.getExe pkgs.slurp})\" ~/Images/grim/$(date +%+4Y-%m-%d_%H-%M-%S).png";

		bindm = [
			"$mod, mouse:272, movewindow"
			"$mod, mouse:273, resizewindow"
			"$mod SHIFT, mouse:272, resizewindow"
		];
	};

	services.hyprpaper.enable = true;
	services.hyprpaper.settings = {
		ipc = "on";
		splash = false;
		preload = [ "/etc/nixos/home/modules/hyprland/wallpapers/jwst.png" ];
		wallpaper = [ ",/etc/nixos/home/modules/hyprland/wallpapers/jwst.png" ];
	};

	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				disable_loading_bar = true;
				grace = 0;
				hide_cursor = true;
				no_fade_in = false;
			};

			background = [
				{
					path = "screenshot";
					blur_passes = 3;
					blur_size = 8;
				}
			];

			input-field = [
				{
					size = "200, 50";
					position = "0, -80";
					monitor = "";
					dots_center = true;
					fade_on_empty = false;
					font_color = "rgb(202, 211, 245)";
					inner_color = "rgb(91, 96, 120)";
					outer_color = "rgb(24, 25, 38)";
					outline_thickness = 5;
					placeholder_text = "<span foreground='##cad3f5'>Password...</span>";
					shadow_passes = 2;
				}
			];
		};
	};

	services.hypridle.enable = true;
	services.hypridle.settings = {
		general = {
			after_sleep_cmd = "hyprctl dispatch dpms on";
			ignore_dbus_inhibit = false;
			lock_cmd = "hyprlock";
		};

		listener = [
			{
				timeout = 30;
				on-timeout = "hyprlock";
			}
			{
				timeout = 60;
				on-timeout = "hyprctl dispatch dpms off";
				on-resume = "hyprctl dispatch dpms on";
			}	
		];
	};
}
