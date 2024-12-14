{...}:
{
	programs.firefox = {
		enable = true;
		profiles.default.search = {
			default = "DuckDuckGo";
			force = true;
			engines = {
				"Bing".metaData.hidden = true;
				"Google".metaData.hidden = true;
				"DuckDuckGo".urls = [{
					template = "https://duckduckgo.com/search";
					params = [{
						name = "q";
						value = "{SearchTerms}";
					}];
				}];
				"Nix Packages".urls = [{
					template = "https://nixos.org/";
					params = [{
						name = "q";
						value = "{SearchTerms}";
					}];

					definedAliases = [ "@np" ];
				}];
			};
		};
	};
}
