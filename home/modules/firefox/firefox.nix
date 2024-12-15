{pkgs, config, ...}:
# let options = import ./options.nix;
# in
{
	home.file.".librewolf" = {
		source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.mozilla/firefox";
		recursive = true;
	};

	programs.firefox = {
		enable = true;
		package = pkgs.librewolf;
		profiles.default = {
			search = {
				default = "DuckDuckGo";
				force = true;
				engines = {
					"Bing".metaData.hidden = true;
					"Google".metaData.hidden = true;

					"Nix Packages" = {
						urls = [{
							template = "https://search.nixos.org/packages";
							params = [
								{ name = "type"; value = "packages"; }
								{ name = "channel"; value = "unstable"; }
								{ name = "query"; value = "{searchTerms}"; }
							];
						}];
						icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@np" ];
					};

					"NixOS Wiki" = {
						urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
						icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@nw" ];
					};

					"MyNixOS" = {
						urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
						iconUpdateURL = "https://mynixos.com/favicon-light.svg";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@mn" ];
					};
				};
			};

			settings = {
				"browser.aboutConfig.showWarning" = false;
				"browser.startup.page" = 3;
				"browser.startup.homepage" = "about:blank";
				"browser.newtabpage.enabled" = false;
				"browser.newtabpage.activity-stream.showSponsored" = false;
				"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
				"browser.newtabpage.activity-stream.default.sites" = "";

				"geo.provider.use_geoclue" = false;

				"intl.accept_languages" = "en-US, en";
				"javascript.use_us_english_locale" = true;

				"extensions.getAddons.showPane" = false;
				"extensions.htmlaboutaddons.recommendations.enabled" = false;
				"browser.discovery.enabled" = false;

				"datareporting.policy.dataSubmissionEnabled" = false;
				"datareporting.healthreport.uploadEnabled" = false;
				"toolkit.telemetry.enabled" = false;
				"toolkit.telemetry.unified" = false;
				"toolkit.telemetry.server" = "data:,";
				"toolkit.telemetry.archive.enabled" = false;
				"toolkit.telemetry.newProfilePing.enabled" = false;
				"toolkit.telemetry.shutdownPingSender.enabled" = false;
				"toolkit.telemetry.updatePing.enabled" = false;
				"toolkit.telemetry.bhrPing.enabled" = false;
				"toolkit.telemetry.firstShutdownPing.enabled" = false;
				"toolkit.telemetry.coverage.opt-out" = true;
				"toolkit.coverage.opt-out" = true;
				"toolkit.coverage.endpoint.base" = "";
				"browser.newtabpage.activity-stream.feeds.telemetry" = false;
				"browser.newtabpage.activity-stream.telemetry" = false;

				"app.shield.optoutstudies.enabled" = false;
				"app.normandy.enabled" = false;
				"app.normandy.api_url" = "";

				"breakpad.reportURL" = "";

				"browser.theme.content-theme" = 0;
				"browser.theme.native-theme" = false;
				"browser.theme.toolbar-theme" = 0;
			};
		};
	};
}
