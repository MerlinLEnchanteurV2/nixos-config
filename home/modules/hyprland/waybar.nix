{ lib, pkgs, ...}:

{
	programs.waybar = {
		enable = true;
		package = pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"] ;} );
		systemd = {
			enable = false;
			target = "graphical-session.target";
		};
		settings = {
			mainBar = {
				layer = "top";
				position = "left";
				modules-left = [ "custom/power" "hyprland/workspaces" ];
				modules-center = [ "clock" ];
				modules-right = [ "cpu" "memory" "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

				"custom/power" = {
					"format" = " 󰐥 ";
					"tooltip" = false;
					"on-click" = "${lib.getExe pkgs.wlogout}";
				};
				"hyprland/workspaces" = {
					"format" = "{icon}";
					"all-outputs" = true;
					"format-icons" = {
						"1" = "1";
						"2" = "2";
						"3" = "3";
						"4" = "4";
						"5" = "5";
						"6" = "6"; 
						"7" = "7"; 
						"8" = "8"; 
						"9" = "9"; 
						"10" = "10";
					};
				};	

				"clock" = {
					"format" = "{:%H\n%M}";
					"tooltip" = true;
					"tooltip-format" = "{:%Y-%m-%d %a}";
				};

				"cpu" = {
					"format" = "{usage}%";
					"tooltip-format" = "CPU: {usage}%";
				};
				"memory" = {
					"interval" = 1;
					"format" = "{used:0.1f}G\n{total:0.1f}G";
					"tooltip-format" = "RAM: {used:0.1f}G/{total:0.1f}G";
				};
				"backlight" = {
					"device" = "intel_backlight";
					"format" = "{icon}";
					"format-icons" = ["󰃚" "󰃛" "󰃜" "󰃝" "󰃞" "󰃟" "󰃠"];
					"tooltip-format" = "{percent}%";
				};
				"pulseaudio"= {
					"format" = "{icon}";
					"format-muted" = "󰝟";
					"tooltip-format" = "{volume}%";
					"format-icons" = {
						"headphone" = "";
						"default" = ["󰕿" "󰖀" "󰕾"];
					};
					"scroll-step" = 1;
					"on-click" = "${lib.getExe pkgs.pavucontrol}";
				};
				"bluetooth" = {
					"format" = "";
					"format-disabled" = "󰂲";
					"format-connected" = "󰂯";
					"tooltip-format" = "{device_enumerate}";
					"tooltip-format-enumerate-connected" = "{device_alias}   {device_address}";
					"on-click" = "kitty ${lib.getExe pkgs.bluetuith}";
				};
				"network" = {
					"format" = "{ifname}";
					"format-wifi" = "";
					"format-ethernet" = "󰈀";
					"format-disconnected" = "󰖪";
					"tooltip-format" = "{essid}";
					"on-click" = "kitty nmtui";
				};
				"battery" = {
					"format" = "{icon}\n{capacity}%";
					"format-icons" =  ["" "" "" "" "" ];
					"format-charging" = "󱐋{icon}";
					"tooltip" = false;
				};
			};
		};

		style = ''
			* {
				border: none;
				font-family: 'Ubuntu Nerd Font';
				font-size: 15px;
				background: #110000;
				color: #b4befe;
			}

			#clock {
				font-size: 20px;
			}
		'';
	};
}
