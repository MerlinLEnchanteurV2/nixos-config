{pkgs, ...}:
{
	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.xserver.xkb = {
		layout = "fr";
		variant = "";
	};
	console.keyMap = "fr";

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
