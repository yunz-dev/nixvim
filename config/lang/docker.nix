{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    docker-compose-language-service
  ];

  extraConfigLua = ''
    require("lspconfig")["docker_compose_language_service"].setup({})
  '';

  plugins = {
    lsp.servers.dockerls.enable = true;

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
