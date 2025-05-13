{ monospaceFont, ... }:
{
	programs.kitty = {
		enable = true;
		font.name = monospaceFont;
		themeFile = "GruvboxMaterialDarkHard";
		settings = {
			cursor_shape = "block";
			cursor_blink_interval = 0;
		};
		shellIntegration = {
			enableFishIntegration = true;
		};
	};
}
