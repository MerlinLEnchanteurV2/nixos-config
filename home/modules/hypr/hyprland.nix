{pkgs, inputs, lib, ...}:
{
	wayland.windowManager.hyprland = {
		xwayland.enable = true;
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
				"$mod, Return, exec, kitty --hold fastfetch"
				"$mod, B, exec, $BROWSER"
				"$mod, space, exec, $BROWSER https://mynixos.com"
				"$mod, S, exec, ${lib.getExe pkgs.signal-desktop}"
	
				"$mod, Backspace, killactive"
				"$mod SHIFT, Escape, togglefloating"
				"$mod, Escape, fullscreen" 

				", F5, exec, ${lib.getExe pkgs.brightnessctl} set 1%-"	
				", F6, exec, ${lib.getExe pkgs.brightnessctl} set 1%+"

				", F3, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
				", F2, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
				", F1, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				", F10, exec, hyprlock"

				", F12, exec, ${lib.getExe pkgs.qalculate-gtk}"

				", Print, exec, ${lib.getExe pkgs.grim} -g \"$(${lib.getExe pkgs.slurp} -d)\" - | ${lib.getExe pkgs.swappy} -f -"

				"$mod SHIFT, H, exec, systemctl hibernate"
			] ++ (
				builtins.concatLists (builtins.genList (i:
					let ws = i + 1;
					in [
						"$mod, code:1${toString i}, workspace, ${toString ws}"
						"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
					])
				9)
			);
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod SHIFT, mouse:272, resizewindow"
			];
		};
	};
}
