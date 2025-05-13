{  pkgs, ... }:

	let
		editor = "hx";
		monospaceFont = "JetBrainsMono Nerd Font";
		email = "bas.bossink@gmail.com";
		name = "Bas Bossink";
		ttl = 86400;
		username = "bas";
	in {
		imports = [
			(import ./programs.nix { inherit name email editor monospaceFont; })
			(import ./services.nix { inherit ttl pkgs; })
		];

		fonts = {
			fontconfig = {
				enable = true;
				defaultFonts = {
					monospace = [ monospaceFont ];
					serif = [ "DejaVu Serif" ];
					sansSerif = [ "DejaVu Sans" ];
				};
			};
		};
		# Home Manager needs a bit of information about you and the paths it should
		# manage.
		home.username = username;
		home.homeDirectory = "/home/${username}";

		# This value determines the Home Manager release that your configuration is
		# compatible with. This helps avoid breakage when a new Home Manager release
		# introduces backwards incompatible changes.
		#
		# You should not change this value, even if you update Home Manager. If you do
		# want to update the value, then make sure to first check the Home Manager
		# release notes.
		home.stateVersion = "23.11"; # Please read the comment before changing.

		# The home.packages option allows you to install Nix packages into your
		# environment.
		home.packages = with pkgs; [
			alacritty
			android-file-transfer
			bat
			bottom-rs
			bluez
			bluez-tools
			coreutils-full
			cups
			cups-filters
			dejavu_fonts
			erlang
			espanso
			evince
			eza
			fd
			ffmpeg-full
			filezilla
			firefox
			fish
			gawk
			ghostty
			git
			gleam
			gnupg
			gnused
			handbrake
			helix
			htop
			hunspell
			hunspellDicts.en_US-large
			hunspellDicts.nl_nl
			imagemagick
			iosevka
			jackett
			jetbrains-mono
			jmtpfs
			kdePackages.bluez-qt
			kdePackages.kdeconnect-kde
			kitty
			krusader
			lazygit
			libnotify
			libreoffice-qt
			libsForQt5.bluez-qt
			lsof
			lua5_4_compat
			lynx
			mc
			meld
			mg
			miller
			mpc-cli
			mpd
			mpv
			nawk
			ncmpcpp
			neovim
			nil
			nload
			noto-fonts
			noto-fonts-color-emoji
			pandoc
			pass
			pinentry-qt
			pomodoro
			poppler_utils
			rclone
			rclone-browser
			rebar3
			recutils
			redshift
			redshift-plasma-applet
			ripgrep
			ripgrep-all
		  roboto
			rofi
			ruplacer
			sd
			super-productivity
			taplo-cli
			taplo-lsp
			texliveFull
			udiskie
			unzip
			vlc
			watchexec
			xsel
			yazi
			yt-dlp
			zathura
			zellij
			zig
			zls
			zoxide
		
			# # Adds the 'hello' command to your environment. It prints a friendly
			# # "Hello, world!" when run.
			# pkgs.hello

			# # It is sometimes useful to fine-tune packages, for example, by applying
			# # overrides. You can do that directly here, just don't forget the
			# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
			# # fonts?
			# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

			# # You can also create simple shell scripts directly inside your
			# # configuration. For example, this adds a command 'my-hello' to your
			# # environment:
			# (pkgs.writeShellScriptBin "my-hello" ''
			#		echo "Hello, ${config.home.username}!"
			# '')
		];

		# Home Manager is pretty good at managing dotfiles. The primary way to manage
		# plain files is through 'home.file'.
		home.file = {
			# # Building this configuration will create a copy of 'dotfiles/screenrc' in
			# # the Nix store. Activating the configuration will then make '~/.screenrc' a
			# # symlink to the Nix store copy.
			# ".screenrc".source = dotfiles/screenrc;

			# # You can also set the file content immediately.
			# ".gradle/gradle.properties".text = ''
			#		org.gradle.console=verbose
			#		org.gradle.daemon.idletimeout=3600000
			# '';
		};

		# Home Manager can also manage your environment variables through
		# 'home.sessionVariables'. If you don't want to manage your shell through Home
		# Manager then you have to manually source 'hm-session-vars.sh' located at
		# either
		#
		#	 ~/.nix-profile/etc/profile.d/hm-session-vars.sh
		#
		# or
		#
		#	 /etc/profiles/per-user/bas/etc/profile.d/hm-session-vars.sh
		#
		home.sessionVariables = {
			EDITOR = "${editor}";
			VISUAL = "${editor}";
		};

		# Let Home Manager install and manage itself.
		programs.home-manager.enable = true;

		dconf.settings = {
		  "org/virt-manager/virt-manager/connections" = {
		    autoconnect = ["qemu:///system"];
		    uris = ["qemu:///system"];
		  };
		};
}
