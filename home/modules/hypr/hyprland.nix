{pkgs, inputs, lib, ...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		settings = {
			"$mod" = "SUPER";
			"$BROWSER" = "librewolf";
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
				"$mod, Return, exec, kitty --hold ${lib.getExe pkgs.fastfetch}"
				"$mod, B, exec, $BROWSER"
				"$mod, space, exec, $BROWSER https://mynixos.com"
	
				"$mod, Backspace, killactive"
				"$mod SHIFT, Escape, togglefloating"
				"$mod, Escape, fullscreen" 

				", XF86MonBrightnessDown, exec, ${lib.getExe pkgs.brightnessctl} set 1%-"
				", XF86MonBrightnessUp, exec, ${lib.getExe pkgs.brightnessctl} set 1%+"

				", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
				", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
				", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

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
		
			binds = "Super_L&Shift_L, S, exec, ${lib.getExe pkgs.grim} -g \"$(${lib.getExe pkgs.slurp} -d)\" - | ${lib.getExe pkgs.swappy} -f -";

			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod SHIFT, mouse:272, resizewindow"
			];
		};
	};
}
