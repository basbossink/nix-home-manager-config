{ editor, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      			set fish_greeting
      			jj util completion fish | source
      		'';
    shellAliases = {
      e = editor;
      edit = editor;
      g = "git";
      ll = "ls -l";
      ".." = "cd ..";
    };
  };
}
