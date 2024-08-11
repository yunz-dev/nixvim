{ pkgs, lib, ... }:
{
  # extraPackages = with pkgs; [ typescript ];

  plugins = {
    lsp.enabledServers = [
      {
        name = "emmet_language_server";
        extraOptions = {
          cmd = [
            (lib.getExe pkgs.emmet-language-server)
            "--stdio"
          ];

          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];
        };
      }
    ];

    conform-nvim = {
      formattersByFt = {
        typescript = [ "eslint_d" ];
        javascript = [ "eslint_d" ];
      };

      formatters.eslint_d = {
        command = "${pkgs.eslint_d}/bin/eslint_d";
      };
    };

    lsp.servers = {
      tsserver = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
        ];

        settings = {
          complete_function_calls = true;
          vtsls = {
            enableMoveToFileCodeAction = true;
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

      eslint = {
        enable = true;
        cmd = [
          (lib.getExe pkgs.eslint_d)
          "--stdio"
        ];

        filetypes = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
        ];
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

  # typescript-tools = {
  #   enable = true;
  #   onAttach = ''
  #     function(client, bufnr)
  #       client.server_capabilities.documentFormattingProvider = false
  #       client.server_capabilities.documentRangeFormattingProvider = false
  #
  #       if vim.lsp.inlay_hint then
  #         vim.lsp.inlay_hint(bufnr, true)
  #       end
  #     end
  #   '';
  #   settings = {
  #     tsserverFilePreferences = {
  #       # Inlay Hints
  #       includeInlayParameterNameHints = "all";
  #       includeInlayParameterNameHintsWhenArgumentMatchesName = true;
  #       includeInlayFunctionParameterTypeHints = true;
  #       includeInlayVariableTypeHints = true;
  #       includeInlayVariableTypeHintsWhenTypeMatchesName = true;
  #       includeInlayPropertyDeclarationTypeHints = true;
  #       includeInlayFunctionLikeReturnTypeHints = true;
  #       includeInlayEnumMemberValueHints = true;
  #     };
  #   };
  # };
  # };

  # keymaps = [
  #   {
  #     mode = "n";
  #     key = "<leader>co";
  #     action = "<cmd>TSToolsOrganizeImports<cr>";
  #     options = {
  #       desc = "Organize Imports";
  #     };
  #   }
  #   {
  #     mode = "n";
  #     key = "<leader>cR";
  #     action = "<cmd>TSToolsRemoveUnusedImports<cr>";
  #     options.desc = "Remove Unused Imports";
  #   }
  # ];
}
