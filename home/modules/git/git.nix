{secrets, pkgs, lib, ...}:
{
	programs.git = {
		enable = true;
		userName  = "${secrets.git.username}";
		userEmail = "${secrets.git.email}";
		extraConfig = {
			credential.helper = "${lib.getExe pkgs.git-credential-manager}";
		};
	};
}
