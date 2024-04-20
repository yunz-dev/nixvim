{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      dockerls.enable = true;
      docker-compose-language-service.enable = true;
    };

    lint = {
      lintersByFt = {
        docker = [ "hadolint" ];
      };

      linters = {
        hadolint = {
          cmd = "${pkgs.hadolint}/bin/hadolint";
        };
      };
    };
  };
}
