{
  name,
  email,
  editor,
}:
{
  programs.git = {
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
        editor = editor;
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
      tg = "tag --sort=-creatordate --format='%(creatordate:short):	 %(refname:short)'";
      tgc = "tag --sort=-creatordate --format='%(creatordate:short):	%(refname:short)' --contains";
      unco = "checkout";
      unstage = "reset HEAD --";
    };
  };
}
