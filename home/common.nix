{ pkgs, ... }:
{
  home = {
    #packages = with pkgs; [
    #];
    sessionVariables = {
      EDITOR = "vim";
    };

    shellAliases = {
      lg = "lazygit";
    };
  };

  programs.git = {
    enable = true;
    userName = "Robert Andersson";
    userEmail = "kemichal@gmail.com";
  };

  programs.bash.enable = true;
}
