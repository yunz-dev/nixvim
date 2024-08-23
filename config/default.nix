{ pkgs, ... }:
{
  enableMan = false;
  # Import all your configuration modules here
  imports = [
    ./autocmd.nix
    ./keymaps.nix
    ./settings.nix
    ./plugins
  ];

  extraPackages = with pkgs; [
    ripgrep
    lazygit
    fzf
    fd
  ];

  # feature that enhances the way Neovim loads and executes Lua modules, 
  # offering improved performance and flexibility.
  luaLoader.enable = true;

  clipboard.providers.wl-copy.enable = true;
}
