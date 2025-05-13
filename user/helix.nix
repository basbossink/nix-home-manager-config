{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        auto-save = true;
        cursorline = true;
        line-number = "relative";
        gutters = [
          "diagnostics"
          "spacer"
          "line-numbers"
          "spacer"
        ];
        shell = [
          "fish"
          "-c"
        ];
        statusline.right = [
          "version-control"
          "workspace-diagnostics"
          "diagnostics"
          "selections"
          "position-percentage"
          "position"
          "total-line-numbers"
          "file-modification-indicator"
          "file-encoding"
        ];
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
    languages = {
      language = [
        {
          name = "nix";
          indent = {
            tab-width = 2;
            unit = "\t";
          };
        }
      ];
    };
  };
}
