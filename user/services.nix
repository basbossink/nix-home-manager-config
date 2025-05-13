{ ttl, pkgs, ... }:
{
	services.gpg-agent = {
		enable = true;
		defaultCacheTtl = ttl;
		maxCacheTtl = ttl;
		defaultCacheTtlSsh = ttl;
		maxCacheTtlSsh = ttl;
		enableSshSupport = true;
		enableFishIntegration = true;
		pinentry.package = pkgs.pinentry-qt;
	};

	services.mpd = {
		enable = true;
		musicDirectory = "/run/media/bas/backup/Music/";
	};

	services.redshift = {
		enable = true;
		tray = true;
		provider = "manual";
		latitude = "5.20790269657479";
		longitude = "51.689228340535905";
	};

	services.udiskie = {
		enable = true;
		tray = "always";
		automount = true;
		notify = true;
	};

	systemd.user.targets.tray = {
		Unit = {
			Description = "Home Manager System Tray";
			Requires = [ "graphical-session-pre.target" ];
		};
	};
}
