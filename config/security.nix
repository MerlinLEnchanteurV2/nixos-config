{pkgs, ...}:
{
	security.pam.services.hyprlock = {};
	security.rtkit.enable = true;
	security.polkit.enable = true;
	
	systemd = {
		user.services.hyprpolkitagent = {
		description = "hyprpolkitagent";
			wantedBy = [ "graphical-session.target" ];
			wants = [ "graphical-session.target" ];
			after = [ "graphical-session.target" ];
			serviceConfig = {
				Type = "simple";
				ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
				Restart = "on-failure";
				RestartSec = 1;
				TimeoutStopSec = 10;
			};
		};
	};
}
