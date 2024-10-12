{ pkgs, lib, ... }:
{

  plugins = {
    conform-nvim.settings = {
      formatters_by_ft = {
        javascript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        svelte = [
          [
            "prettierd"
            "prettier"
          ]
        ];
      };

      formatters.prettierd.command = "${pkgs.prettierd}/bin/prettierd";
    };

    lsp.servers = {
      svelte.enable = true;

      eslint = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
          "vue"
          "html"
          "markdown"
          "json"
          "jsonc"
          "yaml"
          "toml"
          "xml"
          "gql"
          "graphql"
          "svelte"
          "css"
          "less"
          "scss"
          "pcss"
          "postcss"
        ];
        # cmd = [
        #   (lib.getExe pkgs.eslint_d)
        #   "--stdio"
        # ];
      };

      ts-ls = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
          "svelte"
        ];

        settings = {
          complete_function_calls = true;
          vtsls = {
            autoUseWorkspaceTsdk = true;
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true;
              };
            };
          };

          typescript = {
            updateImportsOnFileMove.enabled = "always";
            suggest = {
              completeFunctionCalls = true;
            };

            inlayHints = {
              enumMemberValues.enabled = true;
              functionLikeReturnTypes.enabled = true;
              parameterNames.enabled = "literals";
              parameterTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              variableType.enabled = false;
            };
          };
        };
      };
    };

    lint = {
      lintersByFt = {
        typescript = [ "eslint_d" ];
        javascript = [ "eslint_d" ];
      };

      linters.eslint_d = {
        cmd = "${pkgs.eslint_d}/bin/eslint_d";
      };
    };

    ts-autotag.enable = true;
  };
}
