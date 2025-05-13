{ name, email, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = email;
        name = name;
      };
      ui.paginate = "never";
    };
  };
}
