{ name, email, editor, monospaceFont, ... }:
{
	imports = [
		(import ./fish.nix { inherit editor; })
		(import ./git.nix { inherit name email editor;})
		./helix.nix
		(import ./jujutsu.nix { inherit name email; })
		(import ./kitty.nix { inherit monospaceFont; })
	];

	programs.ncmpcpp = {
		enable = true;
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
}
