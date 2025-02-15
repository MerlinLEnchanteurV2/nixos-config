{pkgs, ...}:
{
	home.packages = with pkgs; [
		keepassxc
		python313
		gcc
		bat
	];
}
