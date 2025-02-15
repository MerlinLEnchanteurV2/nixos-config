{pkgs, ...}:
{
	hardware.graphics.enable = true;
	services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.lightdm.enable = true;
  };
	services.displayManager.sddm = {
		enable = false;
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
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

	fonts.packages = with pkgs; [
		nerd-fonts.ubuntu
	];
}
