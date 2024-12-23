{pkgs, ...}:
{
	home.packages = with pkgs; [
		keepassxc
		rustup
		gcc
	];
}
