{ config, pkgs, ... }:

  let 
    ttl = 86400; 
    name = "Bas Bossink";
    email = "bas.bossink@gmail.com";
  in {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      serif = [ "DejaVu Serif" ];
      sansSerif = [ "DejaVu Sans" ];
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bas";
  home.homeDirectory = "/home/bas";

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
    avidemux
    bat
    bottom-rs
    coreutils-full
    cups
    cups-filters
    delta
    erlang
    espanso
    evince
    eza
    fd
    ffmpeg-full
    firefox
    fish
    gawk
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
    jetbrains-mono
    kitty
    krusader
    lazygit
    libnotify
    libreoffice-qt
    lsof
    lynx
    mc
    meld
    mg
    mpv
    nawk
    neovim
    nerdfonts
    nload
    noto-fonts
    noto-fonts-color-emoji
    pandoc
    pass
    pijul
    pinentry-qt
    pomodoro
    poppler_utils
    qbittorrent
    rclone
    rclone-browser
    rebar3
    redshift
    redshift-plasma-applet
    ripgrep
    ripgrep-all
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
    #   echo "Hello, ${config.home.username}!"
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
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bas/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      jj util completion fish | source
    '';
    shellAliases = {
      e = "hx";
      edit = "hx";
      g = "git";
      ll = "ls -l";
      ".." = "cd .."; 
    };
  };
  
  programs.git = {
    delta = {
      enable = true;
      options = {
      	line-numbers = true;
      	side-by-side = true;
      	syntax-theme = "zenburn";
      };
    };
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      diff.tool = "meld";
      merge.tool = "meld";
      mergetool.keepBackup = false;
      mergetool.meld.cmd = ''meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"'';
      difftool = {
        prompt = false;
        meld = {
          cmd = ''meld "$LOCAL" "$REMOTE"'';
        };
      };
      core = {
      	editor = "hx";
      	trustctime = false;
      	filemode = false;
      	autocrlf = false;
      	untrackedcache = true;
      	fsmonitor = true;
      };
      fetch.writeCommitGraph = true;
      rerere.enabled = true;
      branch.sort = "-committerdate";
      push.autoSetupremote = true;
      commit.verbose = true;
      help.autocorrect = "prompt";
    };
    aliases = {
      br = "branch";
    	bre = "branch --edit-description";
    	ci = "commit";
    	cl = "clone";
    	co = "checkout";
    	cp = "cherry-pick";
    	dc = "diff --cached";
    	df = "diff";
    	dt = "difftool";
    	fff = "flow feature finish";
    	ffp = "flow feature publish";
    	ffs = "flow feature start";
    	fp = "fetch --prune";
    	frf = "flow release finish";
    	frp = "flow release publish";
    	frs = "flow release start";
    	last = "log -1 HEAD";
    	lg = "log --graph --abbrev-commit --decorate --date=relative --all --oneline --no-color";
    	mt = "mergetool";
    	pl = "pull";
    	ps = "push";
    	psf = "push --force-with-lease";
    	root = "rev-parse --show-toplevel";
    	st = "status";
    	sup = "submodule update";
    	tg = "tag --sort=-creatordate --format='%(creatordate:short):  %(refname:short)'";
    	tgc = "tag --sort=-creatordate --format='%(creatordate:short):  %(refname:short)' --contains";
    	unco = "checkout";
    	unstage = "reset HEAD --";
    };
  };

  programs.helix =  {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        auto-save = true;
        cursorline = true;
        line-number = "relative";
        gutters = ["diagnostics" "spacer" "line-numbers" "spacer"];
        shell = ["fish" "-c"];
        statusline.right = ["version-control" "workspace-diagnostics" "diagnostics" "selections" "position-percentage" "position" "total-line-numbers" "file-modification-indicator" "file-encoding"];
        indent-guides = {
          render = true;
          character = "╎"; # Some characters that work well: "▏", "┆", "┊", "⸽"
          skip-levels = 1;
        };
      };
      keys.normal = {
        C-j = [ "save_selection" ];
        C-s = [
          "save_selection"
          "select_all"
          # Delete trailing whitespace from end of each line
          ":pipe sed 's/[ \t]*$//'"
          "collapse_selection"
          "jump_backward"
          "commit_undo_checkpoint"
          ":write"
        ];
      };
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = email;
        name = name;
      };
    };
  };
  
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    theme = "Gruvbox Material Dark Hard";
    settings = { 
      cursor_shape = "block";
      cursor_blink_interval = 0;
    };
    shellIntegration = {
      enableFishIntegration = true;
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."pijul/config.toml".source = (pkgs.formats.toml {}).generate "pijul-config" {
    author = {
      name = "basbossink";
      full_name = name;
      email = name;
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = ttl;
    maxCacheTtl = ttl;
    defaultCacheTtlSsh = ttl;
    maxCacheTtlSsh = ttl;
    enableSshSupport = true;
    enableFishIntegration = true;
    pinentryPackage = pkgs.pinentry-qt;
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
