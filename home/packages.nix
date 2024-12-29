{pkgs, ...}:
{
	home.packages = with pkgs; [
		keepassxc
		#rustup
		#cargo
		gcc
	];
}
