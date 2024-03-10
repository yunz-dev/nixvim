{ pkgs, ... }:
{
  plugins = {
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;

    conform-nvim = {
      formattersByFt = {
        nix = [ "nixpkgs_fmt" ];
      };
      formatters = {
        nixpkgs_fmt = {
          command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
        };
      };
    };

    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };
      linters = {
        statix = {
          cmd = "${pkgs.statix}/bin/statix";
        };
      };
    };

    lsp.servers.nil_ls = {
      enable = true;
    };
  };

  extraConfigVim = ''
    au BufRead,BufNewFile flake.lock setf json
  '';
}
